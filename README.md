Linux-up-to-speed
=================

Basic script for ubuntu-gnome to install packages and configure it from a fresh install

This script assumes you are using ubuntu-gnome 14.04 LTS (trusty) x64:  
http://cdimage.ubuntu.com/ubuntu-gnome/releases/14.04/release/ubuntu-gnome-14.04-desktop-amd64.iso  
http://cdimage.ubuntu.com/ubuntu-gnome/releases/14.04/release/ubuntu-gnome-14.04-desktop-amd64.iso.torrent

-------------------------------------------

#### What all these commands do:
**Adds Repositories:**  
ppa:chris-lea/node.js  
ppa:webupd8team/sublime-text-3  

**Installs:**  
*(apt-get install)*  
chromium-browser - Google Chrome without the extras (Flash, PDF, AAC, MP3, Print-Preview, Google's ™ name/logo, Opt-in usage statistics and crash reports)  
light-themes - Ambiance Theme (configured below)  
dmz-cursor-theme - White Cursor (also configured below)  
nautilus-open-terminal - Right click -> Open directory in terminal  
gparted - GNOME partition editor  
openjdk-7-jdk - Java JRE and JDK  
maven - Java software project management  
eclipse - Java IDE  
sublime-text - The text editor you'll fall in love with  
git - Fast, scalable, distributed revision control system  
meld - Graphical tool to diff and merge files  
curl - CLI tool for file downloading (needed for n)  
nodejs - Event-based server-side javascript engine (temporarily installed with apt, permanently installed with n)

*(npm install -g. Note node prefix changed. See configuration below)*  
n - Node version manager  
yo - CLI tool for scaffolding out Yeoman projects  
bower - The browser package manager  
grunt - The JavaScript Task Runner  
generator-angular - Yeoman generator for AngularJS
less - Css preprocessor  
jshint@2.4.4 - JavaScript Code Quality Tool version 2.4.4. View why I won't use 2.5 at the bottome of this readme

*(other sources)*  
bash-git-prompt - Informative git prompt for bash  
Sublime Package Control - Sublime Text package manager

**Configurations:**  
Due to [running npm with root cause permission problems](http://stackoverflow.com/questions/18212175/npm-yo-keeps-asking-for-sudo-permission), set prefix to ~/.node where sudo isn't required  
Changes theme to ambiance  
Adds default .jshintrc to the home directory (from this repo)  
Show 12h AM/PM clock at the top bar (including day abbreviation, date, seconds)  
Add minimize and maximize back  
Allows workspaces on multiple monitors  
Changes favorite apps to nautilus, chromium, firefox, sublime, terminal  
For gedit, only show tabs if there is more than one tab, show lines numbers, disable word wrap, change tab size to 4, and prevents backup copies (suffixed with "~" that can cause problems when editing system settings)  
For git, sets meld as the diff/merge tool, sets sublime as the core editor, shows color, changes user name/email, prevent creation of .orig files that muck everything up, sets push mode to simple  
For bash-git-prompt, change the unicode symbols and PS1 style  
For Nautilus, disable recursive searching  
Creates a ssh key  
Disabled middle click paste  

-------------------------------------------
#### What's not in the script (yet):
All servers (tomcat, nginx, etc.)  
All sublime packages (excluding package control)  
Development environments (python, c, c++, etc, excluding Java)  
LESS configuration  
Create ssh key  
Interactive configuration  

-------------------------------------------
#### Why jshint 2.4.4 and not 2.5 or later?
Version 2.5 sadly removes many features:  

*Features I don't use:*  
onevar - Condense all var statements into one at the beginning of the function.  
passfail - Abort on first error. Used for scripting.  
gcl - compatibility with Google Closure Linter  

*Features I do use:*  
nomen - No dangling underscores in name (curb against c++ style of "private" variables)  
indent - checking for proper indentation  
smarttabs - allow mixed tabs/space for block-level/alignment  
trailing - checking for trailing whitespace  
white - checking whitespacing style  

These features are important if we wish to have a consistent coding style throughout a team project. It can be picky sometimes, but it promotes good habits and helps keep the code readable and maintainable. To lose this functionality is a shame.