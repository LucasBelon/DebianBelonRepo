#!/bin/bash
<<File_definition
This script is meant to learn and to get ready-to-go all the git things.
It's a part II to init_script.sh, and I'll install git with this script so
I don't lose the flow of this work.
Remember: This also is a file to set things up to a fresh install of debian linux.

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
is the structure of a comment, it will not run on your system.
If you want to run something from inside the comments you'll have to do it manually
The # is a single line comment
Tip4: There are some commands that can be uncommented, just remove the "# $" part.
File_definition

<<From_our_init_script
Let's install git, so we can clone some repositories etc. It's good practice to create a directory
so it won't become a mess in our files. Recomend: $ mkdir -p ~/Projects/GitReps
At first we will learn about git (local machine), and later about github (remote server)
sudo apt install git-all ;
From_our_init_script

echo "This script will install git-all. You must edit this file
to set things up. Will Configure username, user email, and install 
github tools. Also, will generate a SSH key and will try to validate
it with github auth login tool. Press Ctrl+C to cancel
"
echo "8" ;
sleep 1 ;
echo "7" ;
sleep 1 ;
echo "6" ;
sleep 1 ;
echo "5" ;
sleep 1 ;
echo "4" ;
sleep 1 ;
echo "3" ;
sleep 1 ;
echo "2" ;
sleep 1 ;
echo "1" ;
sleep 1 ;

# mkdir -p ~/Projects/Git ;
# cd ~/Projects/Git ;
# sudo apt install git-all -y ;

<<git_config
We should talk first about configuration files. Let's configure

There are 3 levels for configs:
--system: Your whole machine - All user - All respositories
--global: Your user - All repositories
--local: the repository
The config file...
for --system is on /etc/gitconfig; 
for --global is on /home/debian/.gitconfig;
for --local  is on /repository/.git/config
$ git config --global user.name "<FirstName> <LastName>"
$ git config --global user.email "your@email.com"
$ git config --global color.ui auto
Memory Tip: autocrlf stands for Auto Carriage Return Line feed.
$ git config --global core.autocrlf input
It ensures that, if we change to another machine it will understand line endings and
line breaks, because different systems handle line endings and line breaks differently.
To see the git config files run:
$ git config --[local/global/sistem] --list
# After installing and configuring git we need to turn a folder into a local repository
# so we can initiate the work. To initiate, on the project folder you run
$ git init . # it is making the WorkingDirectory a repository
git_config

git config --global user.name "<Your_Name>" ;
git config --global user.email "<Your@email.com>" ;
git config --global color.ui auto ;
git config --global core.autocrlf input ;
git config --global alias.lg "log --oneline --graph --decorate"
# The line above will make log prettier
git config --global alias.ac "commit -am"
# The line above will make an alias "git commit -am" to "git ac"
git config --global core.editor "vim"
<<TeoricExplanation-CommitStages
There is something called two stages commit. 
When you work locally, your files exist in one of four states. They are either untracked, modified, staged, or
committed.
"Committed" can be understood as confirmed, like "put it on stores, it's no longer a prototype"
- Staging is something under tests, a prototype, no longer a sketch
- Modified is somewhere beetween the prototype and the sketch
- Untracked is a sketch, the initial idea, the first step on production flow.
Git tracks these files, and it keep three trees (like three different subjects about the file or the project)
These trees are "Working", "Staging" (also called Index) and "History"
- Working is the development. Someone is writing code, it's a production step.
- Staging is the test step. Someone is putting the code on fire to see if it handles the heat.
- History is when we already tested, and we got a good result. Thats when we do a commit. It's a 
functional version of our code. It's all about a production metaphor
TeoricExplanation-CommitStages

<<Git_TheLocalPart
Youtube Tutorial's url:
https://www.youtube.com/watch?v=3fUbBnN_H2c
Git & GitHub Tutorial on youtube says:
Everything we put on the directory gets untracked. To sent it to staging we do
$ git add <filename>
In the youtube tutorial, Nelson uses:
$ git add .
And says that it's "From here down". So, the entire thing, folders, recursively until the bottom.
He added a index.js empty file.
When you add you send to staging area. If you want to remove from the staging area you do
$ git rm -r --cached .
If we want to add all files, even if we're into a deep subdirectory, we can do
$ git add -A
When we want a checkpoint we do a commit:
$ git commit -m "Descritive message to the commit"
It should work without login, and that's because we're working locally.
How do we see that checkpoint? There's a couple of ways
$ git log : It will show a commit hash on top and other nice informations
we should copy the hash and
$ git show <hash>
On tutorial Nelson changed the index.js and put "console.log("hello git");" inside it then
$ git status
to see that the file now is modified
we could do
$ git restore
if we want to discard changes. We can see what's the difference beetween the versions by using:
$ git diff
Important to do 
$ git log
after almost every 
$ git add
If we don't put a explanatory message to the commit we'll get in trouble to find out what changed.
We can rectify, adjust our message on the commit to make easier to understand
$ git commit --amend -m "correct message"
Git_TheLocalPart

<<GitHubDownloadAndInstall
Remember: <git != github | local != remote>
$ curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
$ sudo apt update
$ sudo apt install gh
$ gh auth login : this login is pretty, you use the arrows and read the instructions, very intuitive
You'll need to do it once, to be able to set your ssh key (and no longer will need a passwd)
Setting an editor:
$ gh config set editor vim
GitHubDownloadAndInstall

# curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg ;

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null ;

sudo apt update ;
sudo apt install gh ;
gh config set editor vim ;

<<SSHkeys
I've entered on the github site and followed the step by step tutorial to
download and login via my computer using a personal authentication token (PAT)
It's the easiest way
The url is $ gh auth login : this login is pretty, you use the arrows and read the instructions, very intuitive
You'll need to do it once, to be able to set your ssh key (and no longer will need a passwd)
Setting an editor:
https://docs.github.com/en/github-cli
The PAT is found over the settings>developer settings > Personal acess token
The url is 
https://github.com/settings/tokens
The youtube tutorial will use a ssh key to connect. I don't think it will be useful meanwhile i'm learning, 
but here we go. If it fails there's a way to do it with browser
 - First step: Checking for existing SSH keys
$ ls -al ~/.ssh
There are some supported filenames for public keys in github
[id_rsa.pub; id_ecdsa.pub; id_ed25519.pub]
 - Second step: Generate a SSH key
$ ssh-keygen -t ed25519 -C "your_email@example.com"
 - Third step: start SSH agent in the background
$ eval "$(ssh-agent -s)"
 - Fourth step: Adgit add README.md ;
git commit -m "first commit" ;
git branch -M main ;
ding your SSH key to the ssh-agent (the name of the private key may change)
$ ssh-add ~/.ssh/id_ed25519
 - Fifth step: add an ssh public key to github account
$ gh ssh-key add <key-file> --title "personal laptop"
example:
$ gh ssh-key add ~~/.ssh/id_ed25519.pub --title "debian"
 - Sixth step: Test ssh connection
$ ssh -T git@github.com (your@email.com)
$ gh auth login : this login is pretty, you use the arrows and read the instructions, very intuitive
You'll need to do it once, to be able to set your ssh key (and no longer will need a passwd)
Setting an editor:
SSHkeys

ssh-keygen -t ed25519 -C "Your@credentials" ;
eval "$(ssh-agent -s)" ;
ssh-add ~/.ssh/id_ed25519 ;
gh ssh-key add ~/.ssh/id_ed25519.pub --title "KeyName";
gh auth login ;

<<CreateOnCLI
When we open a repository by the site it's we see these lines: 
+++
Create a new repository on the command line
$ echo "# <Reponame>" >> README.md
$ git init 
$ git add README.md
$ git commit -m "first commit"
$ git branch -M main
or push an existing repository from the command line
$ git remote add origin git@github.com:amigoscode/learning-git.git
$ git branch -M main
$ git push -u origin main
+++
And then things stop working. But reading more I got the
right command to get thinks working fine

$ gh repo create 
# must be done inside the local repository directory
# checkout this url:
# https://cli.github.com/manual/gh_repo_create
The right way to do thins is, finally:
$ mkdir <NameOfNewRepo> ; cd <NameOfNewRepo>
$ echo "# <NameOfNewRepo>" >> README.md
$ git init 
$ git add README.md
$ git commit -m "first commit"
$ git branch -M main
$ gh repo create 
$ git remote add origin git@github.com:<GitUserName>/<NameOfNewRepo>.git
$ git push -u origin main
CreateOnCLI

<<DISABLED_BUT_USERFUL_FOR_BEGINNERS 
mkdir <RepoName> ; 
cd <RepoName> ;
echo "# First Line On README.md" >> README.md ;
git init ;
git add README.md ;
git commit -m "First Commit On New Repo" ;
git branch -M main ;
# Here's a part where you only need to acept the repository name
gh repo create ;
git push -u origin main ;
DISABLED_BUT_USERFUL_FOR_BEGINNERS


<<keepgoing
We can do now not only push our repositories to git, but also
pull the changes that happens. Remember, it's not only you who's working on it
$ git pull 
Now we will enter on branches topic. We can see the actual branch of our project by
$ git branch
And can see the remote branches
$ git branch -r
And yet see all of them
$ git branch -a
in order to create a new branch we should do
$ git branch feature-a
Where feature-a is the name of the branch. Remember to use concise names
To make changes on that branch we need to switch beetween the branches
$ git checkout feature-a
We can switch to the last branch we were using by
$ git checkout -
In the tutorial it creates a new file, add, commit and sees the log
He returns to the main branch and the we see that the commits aren't shared
He tries to push the branch, and git gives him a command to do it. But he modifies it
It shows:
$ git push --set-upstream origin feature-a
and he does
$ git push -u origin feature-a
Both works well
Nelson changes to main branch, then uses
$ git checkout -b to-delete
which should create a new branch named "to-delete" and then checkout of it
$ git branch -d to-delete
keepgoing

<<ResolvePR
if we remember what git is for, we will get to the point of a supervised project is 
more commom than solo projects. So the main branch is over the adm responsability.
With that said, we do a branch, make some changes, and ask to turn our changes part
of the main branch. We do a pull request. We could do 
$ git merge feature-a
but we won't. In the browser we can see things like Reviewers, Assignees, Labels, 
Projects, Milestones, Linked Issues... with command line we must do
$ git pr feature-a
and after the adm merge to the main project it will be there. We can also do
$ git log --oneline
Remember to delete the branches that were merged
$ git branch -d feature-a
NEVER do a branch of a old version of main branch. THIS WILL MAKE A CATASTROPHIC MESS
First do a pull to get the latest version of the main branch
BUT, conflicts happens. We'll learn how to solve'em
Nelson get's a project, makes a branch, put a html file with a empty body on the branch, 
commit it, so the branch is on repo. He changes the file again, but in the browser, 
so the local doesn't get the updates immediatly.
Now it's when mess comes to show. He make changes on the html on the local, and it's not
updated, so, inconsistencies comes to raise. And git doesn't let you do a pull. But I want
to include my changes. What should I do to reach that goal? When I try to 
$ git pull
It tries to merge conflicts by itself, but if fails.
The file gets weird, but as soon we can solve it we'll move on.
The HEAD is what lives on local, the rest is the repo.
The hash is about the commit of repo which is conflicting with your local.
ResolvePR

<<RebaseThings
Rebase is about putting your changes on a stack, so it will wait to get merged. Then
Pull to get the latest main branch. And finally try to apply the changes.
$ git pull -r origin main
What we got from doing this is another bunch of conflicts, which must be solved by hand
after Nelson solves the conflicts he does
$ git add . ; git rebase --continue
When we do the rebase we can solve conflicts with every commit one by one, in order.
Nelson keeps doing the above commands until there is no conflicts. Finally he does:
$ git pull
And a message comes up saying that it's impossible to pull the branch feature-xyz. 
It seens that git blocks that branch, but, since he corrected conflicts, we must force the pull
mainly because we know that there are no more conflicts there.
$ git push -f
Remember: The main problem comes from a branch that was created from a outdated main.
RebaseThings

<<RebaseRecapThings
When we're truly merging a branch into the main, like in the example where a branch is a feature and
the main is an app, we want to squash our commits, because lots of them are useless when it's close
to the endpoint. Thats why we resolve our dependencies, and turn our branch as clear as possible.
Later, i'll search for "squash and merge" on github.
RebaseRecapThings

<<AwordAboutGuiGit
We have some GUI to work with git on the desktop. There's an official application from github, but also
others. The desktop app can be found in:
https://desktop.github.com/
But it's probably useless, since many IDE's (Integrated development environments) have plugins to work with
git and github. Maybe it would be nice to find out what are the useful functions of git and github by looking
at what the IDE have to offer.
AwordAboutGuiGit

<<GitPod
In github site you can see a button named gitpod. It opens in your browser a vscode that works with the git. Very
useful to weak machines isn't it? (it works on chrome but not sure if it works on any browsers)
GitPod

<<Fireship_io_tips
There are a few tricks from the channel. What I want is to
unite wisdom from all corners, so i'll go with 13 Advanced (but useful) Git Techniques and Shortcuts:
https://www.youtube.com/watch?v=ecK3EnyGD8o
You can jump the command
$ git add .
by performing
$ git commit -am "my commit"
We can configure alias with git config
$ git config --global alias.ac "commit -am"
instead of using 
$ git commit --amend -m "New commit"
We can do a add files on the previous commit (imagine sending a wrong file) by
$ git add . ; git commit --amend --no-edit
We rectify the files, but no need to rectify the commit message.
The github site has a key-binding on the dot key. It will open the gitpod, so you can work remotely.
But it won't open the cloud services if you not tell him to do it.
What if I'm working on a change but it's not ready to be commited yet? Like, almost done, 
but almost screws things, because almost isn't enough.
We can stash things. No one will see that, and you can come back later
$ git stash
to put things
$ git stash pop
to get things back
If you use it a lot you can reference it with a name:
$ git stash save name_of_not_yet_commitable_code
then to see what you got on the stash
$ git stash list
And use the index of the stash list to
$ git stash apply [index]
And it will bring things back as well. 
We can do some modifications on log command to make it more readable and beauty
$ git log --graph --oneline --decorate --all
With git bisect we can run the code modification after modification until it cracks, so we know what's
the part that need to be fixed. It seens to be hard to work, so I'll do some research later
Remember the thing with squashing commits? It comes now:
$ git rebase master --interactive  (the guy on the video does it on vscode)
the program will open a file and switch some lines like "pick <hash> <number of the commit>"
and turn it into "squash <hash> <number of the commit>", except the first one
That file is on /.git/rebase-merge/git-rebase-todo
After saving changes and closing its said that git will open another file, the commit message file
This file will be that first commit plus a combination of those squash commits. And if you don't like this
you can use "fixup" instead of "squash"
He says that you can also do commits with
$ git commit --squash <hash>
or
$ git commit --fixup <hash>
to be even more productive. 
and then do 
$ git rebase -i --autosquash
There are what's called a hook. I think it's another way too much advanced topic, so... later I'll find out.
What if I'm coding and all these things ends up being a bunch of thrash? It can happen. To remove things we can
$ git fetch origin
$ git reset --hard origin/master
It will overwrite your local repository with the remote repository files, and your local repo will be lost forever
and if there's still some random files you can
$ git clean -df
to remove those files as well
Fireship_io_tips


echo "End of script - GitThings.sh"
