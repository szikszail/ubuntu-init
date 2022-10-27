get_latest_python() {
  VERSION=$1
  pyenv install --list | grep --extended-regexp "^\s*$VERSION\.[0-9]+\s*$" | tail -1
}

pyenv_install_latest() {
  set +x
  VERSION=$1
  USE=$2
  FULL_VERSION=$(get_latest_python $VERSION)
  pyenv install $FULL_VERSION -f
  if [ ! -z "$USE" ]; then
    pyenv global $FULL_VERSION
  fi
  set -x
}

export TMPDIR=~/.pyenv_tmp

mkdir -p ~/.pyenv_tmp

# Installing pyenv
curl https://pyenv.run | bash

# Updating .bashrc
cat <<EOF >>~/.bashrc
# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
EOF

# Apply pyenv for this session
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Check
pyenv --version

# Installing python
pyenv update
pyenv_install_latest "3.8"
pyenv_install_latest "3.9"
pyenv_install_latest "3.10" 1
pyenv_install_latest "3.11"

# Check
python --version
pip --version
