

# aliases
alias py=python3
alias python=python3
alias sqlite=sqlite3
alias vim="nvim"
alias pg-start="sudo service postgresql start"
alias mysql-start="sudo /etc/init.d/mysql start"
alias mongodb-start="sudo service mongodb start"
alias redis-start="sudo service redis-server start"
alias subl="/mnt/c/Program\ Files/Sublime\ Text/sublime_text.exe"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias jup='cd $HOME/notebooks && jupyter.exe notebook --no-browser'

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
export WIN_HOME="/mnt/c/Users/abdel"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# adding personal snippets
export PATH=$HOME/notes/configs:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#-- Editor config --
export EDITOR="vi"

#--Node config --
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#--Golang config --
export GOROOT="/usr/local/go"
export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin
export VERSION=1.17 # This specifies the current version of go used;
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/code/go/bin

#--Rust config --
export PATH=$HOME/.cargo/bin:$PATH
source "$HOME/.cargo/env"

#--Carbon config --
# brew import error
# export PATH="$(brew --prefix llvm)/bin:${PATH}"
export PATH="/home/linuxbrew/.linuxbrew/opt/llvm/bin:${PATH}"

#--Flutter & Dart config --
export PATH="$PATH:$HOME/flutter/bin"
export PATH="$PATH:$HOME/flutter/bin/cache/dart-sdk/bin"

#--Android Emulator config --
# Note: may vary with os
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export ANDROID_HOME="$HOME/Android"
export ANDROID_SDK_HOME="$HOME/.android/avd"
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools/bin
#
# Commands run at startup 
#. "$HOME/.cargo/env"


export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin

export ANDROID_HOME="$HOME/Android"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"


export WEBOTS_HOME=/mnt/c/Program\ Files/Webots

# errors with previous installations
unset COLCON_PREFIX_PATH
unset CMAKE_PREFIX_PATH
export AMENT_PREFIX_PATH=/opt/ros/humble
export TURTLEBOT3_MODEL=burger

export PATH=$PATH:$HOME/ardupilot/Tools/autotest
export PATH=$PATH:$HOME/code/v/
export PATH=/usr/lib/ccache:$PATH
alias expl=nautilus
export TURTLEBOT3_MODEL=burger
export GZ_VERSION=harmonic
export GAZEBO_MODEL_PATH=/opt/ros/humble/share/turtlebot3_gazebo/models/
export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/code/template_ws/src/ardupilot_gazebo/build:${GZ_SIM_SYSTEM_PLUGIN_PATH}
export GZ_SIM_RESOURCE_PATH=$HOME/code/template_ws/src/ardupilot_gazebo/models:$HOME/code/template_ws/src/ardupilot_gazebo/worlds:$HOME/code/template_ws:${GZ_SIM_RESOURCE_PATH}
export PATH="/usr/bin/flutter/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
