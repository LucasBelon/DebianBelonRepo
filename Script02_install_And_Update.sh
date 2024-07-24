#! /bin/bash
<<File_definition
Script written to get the OS ready-to-use for a python programmer
It should be used in the scenario where the system is empty
when it was recently installed.

Author: Lucas Gouveia Belon, a brazilian guy.
Filosophy: I want to be able to get ready to use a machine as soon as possible
even if I'm not on my machine. And if I learn something new that works well I want
to be able to share with the larger amount os people as possible. Thats why I'm
writing in english, and why I'm using linux. Anyone can do the following steps and
anyone can get ready to do the same as me. And as bonuses, I get a log of how to get
ready to program in a new machine. 

Tip: Never do a command blindly. If you're not used to Linux do it one by one, reading
what shows up on your screen. If something don't get done you'll be able to run it again
and correct the issue.
Tip2: Where there's a <anything> you should replace it with your infos.
Tip3: The 
<<comment 
__text__ 
comment 
is the structure of a comment, it will not run on your system. To make something run
If you want to run something from inside the comments you'll have to do it manually
The # is a single line comment
Tip4: There are some commands that can be uncommented, just remove the "# $" part.
Tip5: Only run this script on user mode.
File_definition


echo "This script will update the system as a whole and install:
Most things are Unable By Default. Erase the # character to make it work
- Python 3.x
- Python3-dev
- Python3-pip
- Pipenv
- Build-essential
- Sublime Text
- VIM
- wget
- apt-transport-https
- neofetch
THIS WHOLE DIRECTORY MUST BE ON ~/ SO VIM GETS SET UP CORRECTLY
"

echo "IF YOU RAN THIS SCRIPT IN ROOT MODE PRESS CTRL+C IMMEDIATLY" ;


<<Initial_considerations
This script is meant to run once. Since it's a script to set things up there will be some
commands that are commented, so, if it's the first time you run it (it may not be) uncomment
then. Obviously, you need to read this file. I said it, never do a command blindly.
Initial_considerations

<<ToMakeThisRun
In order to make this a executable file, if you download elsewhere but my github repo
you'll need to do by hand:
$ chmod 700 init_script.sh
The line above will turn it on a executable. Run the command in the same directory of the file.
Then, to make it in fact run you should open a terminal on the directory of this file and
$ ./first_script.sh
ToMakeThisRun

<<password
First thing to check, do you have your passwords at hand?
Lets figure it out.
Try to use the command:
$ sudo su
If it doesn't let you do anything because you're not a sudoer (someone 
with "superuser do - su do" privileges) you should check if the root itself has a passwd.

if you have a root passwd:
$ su
- put your root passwd
Some distros have a standard passwd for root, search for it on internet
To become a sudoer you must:
$ adduser <your username> sudo
It should be enough to let you become a poweruser, a sudoer. 
Actually it's adding you to the sudo group.
Remember to reboot your machine so you can get the privileges up to use.
And remember to exit from root login always. It isn't nice to stay on root mode.

if you don't have a root passwd:
in order to put a password that can be used on $ su command do the folowing:
- Enter:
$ sudo su 
it will use your users password, pay attention on what password is required, the
users password or the root password (if it's not the user's, then it's root's).
If some of them is not set then maybe it will ask for the another.

- Use the command:
# passwd
It should let you choose a passwd to your su command
Now we're able to set up the users passwd if not known
$ sudo su
$ passwd

We always know at least one passwd, user's or root's. If none is known than we'll
be in a big trouble, the only chance to fix things up is if the root has no passwd.
password

# the following commands should update and upgrade the general system

sudo apt update --fix-missing -y;
sudo apt upgrade -y;
sudo apt autoclean -y;
sudo apt autoremove -y;

<<Note_about_python
The following commands should install the latest available version of python and
some of it's tools. The latest version it will install depends on your distro.
When we do the install python3.x we're installing a whole bunch of useless libraries
and we want our instalation to be minimal as possible in this sense. python3-dev does
almost the same, but it's a requirement to some other programs.
Note_about_python

#sudo apt install python3-dev -y;
#sudo apt install python3 \
#    python3-venv\
#    python3-pip -y;

#sudo apt install python3.x -y ; 

# -> the most recent python version by today (nov,2021) <- 
# $ sudo apt install python3.10 -y;

#sudo apt install python3-venv -y;

#sudo apt install python3-pip -y;

# pip - A tool for download and install other useful tools
<<Note_about_pip
Pip stands for preferred installer program. I rather remember it as
Package Index Python.
With pip you'll install those python libraries and modules like scipy, pandas
matplotlib, tkinter, beatifulsoup, but remember to install them inside
your virtual environment, or else it will get installed side by side 
to your python interpreter, and we don't want this scenario, we want to be
able to erase things from our system easily, and change the interpreter
if we want to. And its a devops practice to make sure that it's on our
.pip file all the packages that are needed, so if I send the project to
someone else he will be able to install all dependencies with pipenv install
Note_about_pip

#sudo pip3 install pipenv ;

# pipenv - A way to clusterize your applications. 
# It's maybe the most common tool for this purpose on python.

<<asdfProgManager
There's a programming language version manager called asdf, check it out if
it looks useful. For me, right now, it doesn't, just a fresh python is enough.
It become useful if your into different programming projects and you use different
languages from different versions. Remember that modularizing is a good practice.
You should be able to manage what you put in on a way that you can put out. 
There are lots of pitfalls, do things you know how to undo.
asdfProgManager

<<Informations_neofetch
We'll want to install neofetch, it makes us a little more impressive
It show's a nice screen with the system informations, and the way we'll use it, it will
show a nice logo everytime we start the terminal.
Informations_neofetch

sudo apt install neofetch -y ;

<<SystemManagement
Btop is a very nice tool to have on the hand. It's lightweight, works in tty mode,
and is very visual. If it's in the distro repositories, I'll want to install it.
SystemManagement

sudo apt install btop -y;


<<do_it_once 
If you're going to work with git and wants to use vim as editor
for your commits, you can add vim as your editor in the environment variables
with the command that follows. Remember to do it only once. Its not necessary
to keep running the command, it will keep adding the text to the .bashrc file
if you do it.
Also, we put there the neofetch, so we get that nice efect of a logo when we 
open the terminal.
do_it_once

# echo "EDITOR=vim" >> ~/.bashrc ;
# echo "neofetch" >> ~/.bashrc ;

<<deb_packages
To install a program from a .deb package we should use:
$ sudo dpkg -i <arquivo>.deb
Let's install also a package that ensure that we can install
packages from source code. This also will allow us to use
$ checkinstall
This will make a .deb from the source, so
it will be easier to remove in further time.
And by it's side we'll install cmake, a dependencie from a vim plugin
deb_packages

sudo apt install build-essential -y ;

<<InternetBrowser
In my opinion, opera is the best browser to be used on worse machines. 
It has somekind of the sleep tabs feature, which will not make you run out of ram that fast.
So, go to opera site and download the .deb package, and use:
$ cd ~/Downloads ; dpkg -i <package_name>
It will throw you into the Downloads directory and then install the package using dpkg tool.
Note: .deb packages are like .exe or .msi (microsoft install), but for debian based system
Others can be .rmp (from RedHat based system)
InternetBrowser


<<Change_Path_variable
To add a file to be executed on CLI by it's name is needed to add the original executable file.
We're adding a environment variable to $PATH, it will search the command on these directories
Caution: The path to the file may not be the same. I'm showing two ways to do it:
- Adding the path of the file to the PATH variable only for today
$ export PATH=$PATH:/home/bandeja/Downloads/pycharm-community-2021.2.3/bin
- Adding the path of the file to the PATH variable everytime the system boots up
(because .bashrc gets read on the boot of the terminal)
$ echo "export PATH=$PATH:/home/bandeja/Downloads/pycharm-community-2021.2.3/bin" >> ~/.bashrc
The package source should be in a better place like /usr/bin/pycharm-community-2021.2.3
where you won't be able to poke things and break them
And if we do not have the name without the extension? Well, we can make a symlink or a 
hardlink by
$ ln -s executable.sh executable
It will do the job.
Change_Path_variable

<<SublimeText_with_wget
In order to install sublime-text x it's needed to have wget installed.
So, first we install the tool, then we use the step-by-step tutorial
that we see in the site. The lines below are up to install stable version.
You should check on the official site if those lines are still valid.
SublimeText_with_wget

sudo apt install wget curl -y;
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - ;

# In debian 11, apt-key is deprecated, but for now it's working. You should get to know
# what's the tool that will replace it.

#sudo apt install apt-transport-https -y;
#echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list ;
#sudo apt install sublime-text -y ;

# The Sublime-Text is installed over the alias "subl". To make it run in the background do 
# $ subl &

<<Vim_is_powerful
Vim is a good editor, and I'll let you choose two versions. One with the plugins 
(and it lasts forever to install), and other without it, the one with plugins will be installed
with another .sh file, so don't worry for now.
Vim_is_powerful

sudo apt install vim -y ;

mkdir -p ~/.vim/autoload ; # I'm not sure what is this for
mkdir -p ~/.vim/backup ; # our backup files will end up here
mkdir -p ~/.vim/color ; # Your colorschemes should be over here
mkdir -p ~/.vim/undodir ; # undodir is there to prevent a bunch of swp files
mkdir -p ~/.vim/bundle ; # The bundle directory is where our plugins should be
mkdir -p ~/.vim/after/ftplugin ; # Our typefiles configs will be here

cp ./vimrc  ~/.vim/ ; # Copy vimrc to ~/.vim/

# Copiando o arquivo de configuração do tmux
cp ./tmux.conf ~/.tmux.conf ;

# Correção de configurações de data e hora para dual boot (linux mint).
timedatectl set-local-rtc 1;

# Atualização final, autoclean e autoremove
sudo apt update -y;
sudo apt upgrade -y;
sudo apt autoclean -y;
sudo apt autoremove -y;

echo "end of the script"
