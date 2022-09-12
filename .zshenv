

# aliases
alias py=python3
alias python="python.exe"
alias sqlite=sqlite3
alias vim="nvim"
alias pg-start="sudo service postgresql start"
alias mysql-start="sudo /etc/init.d/mysql start"
alias mongodb-start="sudo service mongodb start"
alias redis-start="sudo service redis-server start"
alias subl="/mnt/c/Program\ Files/Sublime\ Text/sublime_text.exe"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias jup='cd /home/manan/notebooks && jupyter.exe notebook --no-browser'

alias redis-stop="sudo service redis-server stop"
alias pg-stop="sudo service postgresql stop"
alias mangodb-stop="sudo service mangodb stop"
alias mysql-stop="sudo /etc/init.d/mysql stop"

alias pg-run='sudo -u postgres psql'
alias mysql-run='sudo mysql'

#alias xclip for clipboard
alias copy="xclip -selection clipboard"
alias "c=xclip"
alias "p=xclip -o"
alias "v=xclip -sel clip"

# Paths

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# adding personal snippets
export PATH=$HOME/notes/configs:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#--Node config --
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#--Golang config --
export GOROOT=/usr/local/go-1.19
export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin
export VERSION=1.17 # This specifies the current version of go used;
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/code/go/bin

#--Rust config --
export PATH=$HOME/.cargo/bin:$PATH

#--Carbon config --
export PATH="$(brew --prefix llvm)/bin:${PATH}"


