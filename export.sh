#!/bin/zsh

USER="$(whoami)"

# get installed casks and packages
brew leaves > brew.txt
brew list --cask > brewCask.txt

# strip hyphens to try and get the most relevant plist files
tr "-" "\n" < brew.txt > b.txt
tr "-" "\n" < brewCask.txt > bc.txt

WORKDIR=$(dirname $(realpath -s $0))
echo $WORKDIR
BREW=$WORKDIR"/b.txt"
BREWCASK=$WORKDIR"/bc.txt"
OTHER=$WORKDIR"/otherPrefs.txt"

# get plist files
cd /Users/$USER/Library/Preferences

function cpPrefs () {
    while read KEY2; do
        for file in *.plist;do
            if [[ "$file" == *"$KEY2"* ]];then
                printf '%s\n' "$file"
                # have this cp file to dir
                cp $file $WORKDIR"/prefs/"
            fi
        done
    done <$1
}

cpPrefs $BREW
cpPrefs $BREWCASK
cpPrefs $OTHER

cd $WORKDIR 
rm bc.txt
rm b.txt

# need to get zsh and starship prefs/plugins
sudo cp ~/.zshrc terminal/.zshrc
sudo cp -R ~/.zsh terminal/
sudo cp ~/.config/starship.toml terminal/
sudo cp ~/.gitignore_global terminal/