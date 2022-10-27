# Installing powerline
sudo add-apt-repository universe
sudo apt install powerline -y

# Updating .bashrc
cat <<EOF >>~/.bashrc
# Powerline configuration
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi
EOF

# Enabling powerline
powerline-daemon -q
export POWERLINE_BASH_CONTINUATION=1
export POWERLINE_BASH_SELECT=1
source /usr/share/powerline/bindings/bash/powerline.

# Configuring powerline
mkdir -p ~/.config/powerline
cp -R /usr/share/powerline/config_files/* ~/.config/powerline
powerline-daemon --replace

# Installing vim
sudo apt install vim -y

# Configuring vim
cat <<EOF >>~/.vimrc
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
EOF