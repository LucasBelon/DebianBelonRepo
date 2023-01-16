pkg install zsh ;

pkg install lsd ;

pkg install curl ;

VER=v2.1.0 ;

cd ~/.termux ;
curl -fLo font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/$VER/Hack.zip ;
mkdir fonts ;
mv font.zip fonts ;
cd fonts ;
unzip font.zip ;
mv "Hack Regular Nerd Font Complete.ttf" .. ;
cd .. ;
mv "Hack Regular Nerd Font Complete.ttf" font.ttf ;
rm -rf fonts

echo alias ls=lsd >> /data/data/com.termux/files/usr/etc/zshrc
echo alias ls=lsd >> /data/data/com.termux/files/usr/etc/bash.bashrx

