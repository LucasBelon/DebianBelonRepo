cat ./vimrcPlugins >> ~/.vim/vimrc ;

sudo apt install vim-nox -y; # It's a Vundle Requirement

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim ; # It's a Vundle requirement

vim +PluginInstall +qall ; # It will install all plugins 
