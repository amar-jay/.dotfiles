
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

#--Carbon config --
# brew import error
# export PATH="$(brew --prefix llvm)/bin:${PATH}"
export PATH="/home/linuxbrew/.linuxbrew/opt/llvm/bin:${PATH}"

export WEBOTS_HOME=/mnt/c/Program\ Files/Webots

# errors with previous installations
unset COLCON_PREFIX_PATH
unset CMAKE_PREFIX_PATH
export AMENT_PREFIX_PATH=/opt/ros/humble
export TURTLEBOT3_MODEL=burger

export PATH=$PATH:$HOME/ardupilot/Tools/autotest
export PATH="$PATH:$HOME/code/v"
export PATH=/usr/lib/ccache:$PATH
export TURTLEBOT3_MODEL=burger
export GZ_VERSION=harmonic
export GAZEBO_MODEL_PATH=/opt/ros/humble/share/turtlebot3_gazebo/models/
export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/code/template_ws/src/ardupilot_gazebo/build:${GZ_SIM_SYSTEM_PLUGIN_PATH}
export GZ_SIM_RESOURCE_PATH=$HOME/code/template_ws/src/ardupilot_gazebo/models:$HOME/code/template_ws/src/ardupilot_gazebo/worlds:$HOME/code/template_ws:${GZ_SIM_RESOURCE_PATH}
export PATH="/usr/bin/flutter/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"


export FLYCTL_INSTALL="/home/manan/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export PATH="$PATH:/home/manan/.cache/scalacli/local-repo/bin/scala-cli"
