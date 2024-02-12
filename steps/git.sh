sudo apt install git -y
git --version

read -p "Git e-mail:" EMAIL
git config --global user.email "$EMAIL"

read -p "Git username:" USERNAME
git config --global user.name "$USERNAME"

# Handy commands and settings
# Source: https://www.youtube.com/watch?v=aolI_Rz0ZqY
git config --global rerere.enabled true
git config --global alias.blaame "blame -w -C -C -C"
git config --global column.ui auto
git config --global branch.sort -committerdate
