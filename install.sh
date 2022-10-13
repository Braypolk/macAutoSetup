#!/bin/zsh

IN_DIR=$(dirname $(realpath -s $0))

# Install workman keyboard layout
cd ~/Downloads
curl -sS "https://github.com/workman-layout/Workman/zipball/master" > workman.zip
unzip workman.zip
rm workman.zip
cd mac
sudo cp Workman.bundle /Library/Keyboard Layouts/
open "x-apple.systempreferences:"
echo "Go to Users & Groups -> Login Options -> select show input menu in login window"

cd

# Check that Homebrew is installed and install if not
# install as much as I can with brew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew tap homebrew/cask-drivers
brew update
xargs brew install < $IN_DIR/brew.txt
xargs brew install --cask < $IN_DIR/brewCask.txt
brew upgrade
brew cleanup

# Git setup
read -p "Use braypolk@gmail for git? y/n " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  git config --global user.name "Bray Polkinghorne"
  git config --global user.email "braypolk@gmail.com"
else
  read -p "Git username: " name
  read -p "Git email: " email
  git config --global user.name $name
  git config --global user.email $email
fi

ssh-keygen
cat ~/.ssh/id_rsa.pub | pbcopy

cd $IN_DIR

# place configs and prefs
sudo cp terminal/.zshrc ~/
sudo cp -R terminal/.zsh ~/
sudo cp terminal/starship.toml ~/.config/

sudo cp -R prefs/. ~/Library/Preferences/

sudo cp terminal/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

cd
gh auth login
gh repo clone deviantfero/wpgtk
cd wpgtk
sudo pip3 install pywall
sudo pip3 install wpgtk
wpg

cd $IN_DIR
chmod +x submodules.sh
source ./submodules.sh