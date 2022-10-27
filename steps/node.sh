# Installing NVM
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# Enabling NVM
set +x
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
set -x

set_up_node() {
  set +x
  VERSION=$1

  # Install
  nvm install $VERSION

  # User
  nvm use $VERSION
  set -x

  # Globals
  npm i -g yarn dotenv-ng ts-node cross-env aws-cdk
}

# Current
set_up_node "node"
# LTS
set_up_node "lts/*"