#! /bin/bash
termux-change-repo ;

pkg install zsh lsd curl openssh;

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

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

echo 'export PATH=/data/data/com.termux/files/home/.local/bin:$PATH' >> /data/data/com.termux/files/usr/etc/zshrc ;
 
echo 'export PATH=/data/data/com.termux/files/home/.local/bin:$PATH' >> /data/data/com.termux/files/usr/etc/bash.bashrc ;

bash < (curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) ;

termux-reload-settings ;


