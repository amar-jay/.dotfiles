#!/bin/bash

ln -s ./.config/.zshenv ./.zshenv 
ln -s ./.config/.zshrc ./.zshrc 
ln -s ./.config/.tmux.conf ./.tmux.conf 
ln -s ./.config/.tmux ./.tmux
ln -s ./.config/.oh-my-zsh ./.p10k.zsh

BACKUP_DIR=$HOME/.config_bak
mkdir -p BACKUP_DIR


# Function to display error messages and exit
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

  # TODO: use gh else use git, if gh, fork it.
#  gh repo clone amar-jay/.dotfiles $dir_name || error_exit "Failed to clone amar-jay/.dotfiles repository"

  git clone https://github.com/amar-jay/.dotfiles $dir_name || error_exit "Failed to clone amar-jay/.dotfiles repository"

  echo "Setting my variables, boy!!! Forget it if you set one already. Im overriding it."


  rm -rf $NVIM_CONFIG_DIR
  rm -rf $TMUX_CONFIG_FILE

  cp -r $dir_name/nvim $NVIM_CONFIG_DIR
  cp -r $dir_name/tmux $TMUX_CONFIG_FILE

  echo "export XDG_CONFIG_HOME='$NVIM_CONFIG_DIR'"" >> $HOME/.bashrc
  echo "export TMUX_CONFIG='$TMUX_CONFIG_FILE'"" >> $HOME/.bashrc

  source $HOME/.bashrc


  tmux --version
  nvim --version #+PlugInstall +qall

  greetings
}


_setup
