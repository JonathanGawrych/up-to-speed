Linux-up-to-speed
=================

Basic script for ubuntu-gnome to install packages and configure it from a fresh install

This script assumes you are using ubuntu-gnome 14.04 LTS (trusty) x64:  
http://cdimage.ubuntu.com/ubuntu-gnome/releases/14.04/release/ubuntu-gnome-14.04-desktop-amd64.iso  
http://cdimage.ubuntu.com/ubuntu-gnome/releases/14.04/release/ubuntu-gnome-14.04-desktop-amd64.iso.torrent

-------------------------------------------
<div align="center">Modify the script and put in your name/email in the git config commands.<br />
Please don't make your commits under my name</div>
-------------------------------------------

###$ What all these commands do:
**Adds Repositories:**  
ppa:chris-lea/node.js  
ppa:webupd8team/sublime-text-3  

**Installs:**  
*(apt-get install)*  
chromium-browser - Google Chrome without the extras (Flash, PDF, Print-Preview, Google™, Opt-in Usage statistics and Crash reports, AAC, and MP3)  
light-themes - Ambiance Theme (configured below)  
dmz-cursor-theme - White Cursor  
nautilus-open-terminal - Right click -> Open directory in terminal  
openjdk-7-jdk - Java JRE and JDK  
maven - Java software project management  
eclipse - Java IDE  
sublime-text - The text editor you'll fall in love with  
git - Fast, scalable, distributed revision control system  
meld - Graphical tool to diff and merge files  
nodejs - Event-based server-side javascript engine

*(npm install -g)*  
n - Node version manager  
less - Css preprocessor  
jshint - JavaScript Code Quality Tool

*(other sources)*  
bash-git-prompt - Informative git prompt for bash  
Sublime Package Control - Sublime Text package manager

**Configurations:**  
Changes theme to ambiance  
Adds default .jshintrc to the home directory (from this repo)
Show 12h AM/PM clock at the top bar (including day abbreviation, date, seconds)  
Add minimize and maximize back  
Allows workspaces on multiple monitors  
Changes favorite apps to nautilus, chromium, firefox, sublime, terminal  
For gedit, only show tabs if there is more than one tab, show lines numbers, disable word wrap, change tab size to 4, and prevents backup copies (suffixed with "~" that can cause problems when editing system settings)  
For git, sets meld as the diff/merge tool, show color, change user name/email, prevent creation of .orig files that muck everything up, sets push mode to simple
For bash-git-prompt, change the unicode symbols and PS1 style  
Remove nag from Sublime  

-------------------------------------------
#### What's not in the script (yet):
All servers (tomcat, nginx, etc.)  
All sublime packages (excluding package control)  
Development environments (python, c, c++, etc, excluding Java)  
LESS configuration  
Create ssh key  
Interactive configuration  
