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

#### What all these commands do:
**Adds Repositories:**  
node.js PPA  
sublime-text PPA  

**Installs:**  
chromium-browser, light-themes, dmz-cursor-theme, nautilus-open-terminal, n, bash-git-prompt, openjdk-7-jdk, nodejs, sublime-text, git, meld, less, jshint, eclipse, maven, Sublime Package Control

**Configurations:**  
Changes theme to ambiance  
Show 12h AM/PM clock at the top bar (including day abbreviation, date, seconds)  
Add minimize and maximize back  
Allows workspaces on multiple monitors  
Changes favorite apps to nautilus, chromium, firefox, sublime, terminal  
For gedit, only show tabs if there is more than one tab, show lines numbers, disable word wrap, change tab size to 4, and prevents backup copies (suffixed with "~" that can cause problems when editing system settings)  
For git, sets meld as the diff/merge tool, show color, change user name/email, prevent creation of .orig files that muck everything up, sets push mode to simple
For bash-git-prompt, change the unicode symbols and PS1 style  

-------------------------------------------
#### What's not in the script (yet):
All servers (tomcat, nginx, etc.)  
All sublime packages (excluding package control)  
Development environments (python, c, c++, etc, excluding Java)  
LESS configuration  
Jshint preferences  
Create ssh key  
Interactive configuration  
Remove dumb amd watermark (not applicable to all machines)  
Remove bloat (honestly, there isn't much in gnome. No search tracking like in unity)  
