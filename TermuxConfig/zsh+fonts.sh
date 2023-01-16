#! /bin/bash

pkg install zsh ;

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

pkg install lsd ;

pkg install curl ;

cd ~/.termux ;
curl -fLo font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip ;
mkdir fonts ;
mv font.zip fonts ;
cd fonts ;
unzip font.zip ;
mv "Hack Regular Nerd Font Complete.ttf" .. ;
cd .. ;
mv "Hack Regular Nerd Font Complete.ttf" font.ttf ;
rm -rf fonts

echo alias ls=lsd >> /data/data/com.termux/files/usr/etc/zshrc ;
echo alias ls=lsd >> /data/data/com.termux/files/usr/etc/bash.bashrc ;

termux-reload-settings ;
