sudo apt install git -y
git --version

read -p "Git e-mail:" EMAIL
git config --global user.email "$EMAIL"

read -p "Git username:" USERNAME
git config --global user.name "$USERNAME"