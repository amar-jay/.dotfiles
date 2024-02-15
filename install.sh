#!/bin/bash

ln -s $HOME/.config/.zshenv $HOME/.zshenv 
ln -s $HOME/.config/.zshrc $HOME/.zshrc 
ln -s $HOME/.config/tmux/tmux.conf $HOME/.tmux.conf 
ln -s $HOME/.config/tmux $HOME/.tmux
ln -s $HOME/.config/.oh-my-zsh ./.p10k.zsh

BACKUP_DIR=$HOME/.config_bak
mkdir -p BACKUP_DIR


# to display error messages and exit
function error_exit() {
    echo "$1" 1>&2
    exit 1
}


check_installed() {

  # Check if neovim is already installed
  if ! command -v nvim &> /dev/null; then
      echo "Neovim is not installed. Installing..."
      # Check the package manager and install neovim accordingly
      if command -v apt-get &> /dev/null; then
          sudo apt-get install neovim -y || error_exit "Failed to install neovim"
      elif command -v pacman &> /dev/null; then
          sudo pacman -S neovim --noconfirm || error_exit "Failed to install neovim"
      elif command -v brew &> /dev/null; then
          brew install neovim || error_exit "Failed to install neovim"
      else
          error_exit "Unable to determine package manager. Please install Neovim manually."
      fi
  else
      echo "Neovim is already installed."
  fi


  # Check if tmux is already installed
  if ! command -v tmux &> /dev/null; then
      echo "Neovim is not installed. Installing..."
      # Check the package manager and install neovim accordingly
      if command -v apt-get &> /dev/null; then
          sudo apt-get install tmux -y || error_exit "Failed to install tmux"
      elif command -v pacman &> /dev/null; then
          sudo pacman -S tmux --noconfirm || error_exit "Failed to install tmux"
      elif command -v brew &> /dev/null; then
          brew install tmux || error_exit "Failed to install tmux"
      else
          error_exit "Unable to determine package manager. Please install Tmux manually."
      fi
  else
      echo "Neovim is already installed."
  fi
}

# Find the config directory using XDG_CONFIG_HOME, fallback to default
if [[ -n $XDG_CONFIG_HOME ]]; then
    NVIM_CONFIG_DIR="$XDG_CONFIG_HOME/nvim"
else
    NVIM_CONFIG_DIR="$HOME/.config/nvim"
fi

echo "Using neovim config directory: $NVIM_CONFIG_DIR"


# Find the config file using TMUX_CONFIG, fallback to default
if [[ -n $TMUX_CONFIG ]]; then
    TMUX_CONFIG_FILE="$TMUX_CONFIG"
else
    TMUX_CONFIG_FILE="$HOME/.tmux.conf"
fi

echo "Using TMUX config file: $TMUX_CONFIG_FILE"


backup_config() {

  # --- TMUX ---
  
    # Check if config file exists
    if [[ ! -f $TMUX_CONFIG_FILE ]]; then
        error_exit "TMUX config file not found. Exiting."
    fi

    # Create backup filename
    backup_filename="tmux-$(date +"%Y%m%d").conf.bak"

    # Backup the previous config file
    echo "Creating backup..."
    tar -czf "$BACKUP_DIR/$backup_filename" "$TMUX_CONFIG_FILE"
#    cp "$TMUX_CONFIG_FILE" "$BACKUP_DIR/$backup_filename"

    echo "TMUX backup created: $BACKUP_DIR/$backup_filename"


  # --- NVIM ---
  
    # Check if config directory exists
    if [[ ! -d $NVIM_CONFIG_DIR ]]; then
        error_exit "Config directory not found. Exiting."
    fi

    # Create backup filename
    backup_filename="nvim-$(date +"%Y%m%d_%H%M%S").tar.bak"

    # Backup the previous config using tar
    echo "Creating backup..."
    tar -czf "$BACKUP_DIR/$backup_filename" "$NVIM_CONFIG_DIR" .

    echo "Neovim backup created: $BACKUP_DIR/$backup_filename"
}

clone_repo() {
  local repo_name=$1
  local destination=$2

    # Check if the gh CLI is installed
  if command -v gh &> /dev/null; then
      
      # Check if already forked
      forked=$(gh repo view $repo_name --json fork --jq '.fork')
      if [[ "$forked" == "true" ]]; then
          echo "You have already forked the repository. Cloning your fork."
          git clone "$(gh repo view $repo_name --json html_url --jq '.parent.fork.html_url')"  "$destination" || error_exit "Failed to clone $repo_name repository"

      else
          echo "Forking the repository..."
          gh repo fork $repo_name --clone
          mv "$repo_name" "$destination"
      fi
  else
      echo "gh CLI is not installed. Cloning the $repo_name repository using git."
      git clone https://github.com/$(repo_name).git "$destination" || error_exit "Failed to clone $repo_name repository"
  fi

}

greetings() {
  # Beautiful description of the nvim-config
  echo ""
  echo "=================================================================="
  echo "          Welcome to amarjay's Dev setup!"
  echo "=================================================================="
  echo ""
  echo "This is amarjay's nvim-config, built with Neovim, LazyVim, Mason and TMUX"
  echo ""
  echo "Neovim is a powerful text editor that provides an intuitive and extensible"
  echo "editing environment. With LazyVim, we bring laziness to the next level,"
  echo "automating repetitive tasks and reducing cognitive load. Mason enhances"
  echo "Neovim's capabilities, allowing seamless integration of various tools"
  echo "and workflows."
  echo ""
  echo "With this configuration, you'll unleash your productivity, effortlessly"
  echo "navigating through code, writing prose, or tinkering with configurations."
  echo "Say goodbye to mundane tasks and hello to a world of efficient editing!"
  echo ""
  echo "In the case where you have problems with emojis and icons,"
  echo "donwload and install any nerd fonts on your PC."
  # TODO: fetch link to nerdfonts
  echo "https://"

  echo "Setup completed successfully."

  echo "Happy Hacking!!😉"
  echo ""
  echo "=================================================================="
  echo ""
}


_setup() {
  # make sure `tmux` and `nvim` exists first, else install
  check_installed


  # backup previous configs
  backup_config
  

  dir_name = "dotfiles-$(date +"%Y%m%d")"

  # use gh else use git, if gh, fork it first.
  clone_repo "amar-jay/.dotfiles" $dir_name


  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  echo "Setting my variables, boy!!! Forget it if you set one already. Im overriding it."


  rm -rf $NVIM_CONFIG_DIR
  rm -rf $TMUX_CONFIG_FILE

  cp -r $dir_name/nvim $NVIM_CONFIG_DIR
  cp -r $dir_name/tmux $TMUX_CONFIG_FILE

  echo "export XDG_CONFIG_HOME='$NVIM_CONFIG_DIR'" >> $HOME/.bashrc
  echo "export TMUX_CONFIG='$TMUX_CONFIG_FILE'" >> $HOME/.bashrc

  if [ ! -e "$TMUX_CONFIG_FILE/plugins/tpm" ]; then
  printf "WARNING: Cannot found TPM (Tmux Plugin Manager) \
    at default location: \$HOME/.tmux/plugins/tpm.\n"
  git clone https://github.com/tmux-plugins/tpm $TMUX_CONFIG_FILE/plugins/tpm
  fi


  source $HOME/.bashrc


  tmux --version
  nvim --version #+PlugInstall +qall

  greetings
}


_setup
