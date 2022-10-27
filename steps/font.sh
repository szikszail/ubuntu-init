FONTS_FOLDER=~/.local/share/fonts

download_and_install_hack() {
  VERSION=$1
  echo "Downloading Hack $VERSION"
  curl -GL https://github.com/source-foundry/Hack/blob/master/build/ttf/Hack-$VERSION.ttf -o "$FONTS_FOLDER/Hack-$VERSION.ttf"
  chmod 644 "$FONTS_FOLDER/Hack-$VERSION.ttf"
}

# Setting up folder
if [ ! -d "$FONTS_FOLDER" ]; then
  mkdir -p $FONTS_FOLDER
fi

# Download hack
download_and_install_hack "Bold"
download_and_install_hack "BoldItalic"
download_and_install_hack "Italic"
download_and_install_hack "Regular"

# Refreshing fonts
fc-cache -f -r -v

# MS fonts
sudo apt install ttf-mscorefonts-installer -y