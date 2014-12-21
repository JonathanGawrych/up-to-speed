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
ppa:webupd8team/atom

**Installs:**  
*(apt-get install)*  
chromium-browser - Google Chrome without the extras (Flash, PDF, AAC, MP3, Print-Preview, Google's @trade; name/logo, Opt-in usage statistics and crash reports)  
light-themes - Ambiance Theme (configured below)  
dmz-cursor-theme - White Cursor (also configured below)  
nautilus-open-terminal - Right click -> Open directory in terminal  
gparted - GNOME partition editor  
openjdk-7-jdk - Java JRE and JDK  
openjdk-7-source - Java source code
maven - Java software project management  
eclipse - Java IDE  
sublime-text - The text editor you'll fall in love with  
atom - A hackable text editor for the 21st Century  
vim - You know what vim is  
git - Fast, scalable, distributed revision control system  
meld - Graphical tool to diff and merge files  
curl - CLI tool for file downloading (needed for n)  
nodejs - Event-based server-side javascript engine (temporarily installed with apt, permanently installed with n)  
tomcat7 - Servlet and JSP engine  
nginx - Reverse proxy server and web server  
lxc-docker - Official Docker daemon package (not from Ubuntu repository)

*(npm install -g. Note node prefix changed. See configuration below)*  
bower - The browser package manager  
grunt - The JavaScript Task Runner  
less - Css preprocessor  
jscs - JavaScript Code Style Tool  
jshint - JavaScript Code Quality Tool
n - Node version manager  

*(apm install (Atom Packages))*  
atom-color-highlight - Highlights color in files  
autocomplete-paths - Adds path autocompletion to autocomplete+  
autocomplete-plus - Display possible completions in the editor while typing  
color-picker - A Color Picker for the Atom Editor. Right click a color and select color picker to open it  
editorconfig - Helps developers maintain consistent coding styles between different editors  
enhanced-package-list - Adds an icon to bundled packages and fades out disabled packages in the settings view  
file-icons - Assign file extension icons and colours for improved visual grepping  
git-difftool - Opens the current project in the diff tool you have configured in your .gitconfig  
linter - Validates your code using linters  
linter-jscs - Linter plugin for JavaScript, using JSCS  
linter-jshint - Linter plugin for JavaScript, using jshint  
minimap - A preview of the full source code  
minimap-color-highlight - A minimap binding for the atom-color-highlight package  
minimap-find-and-replace - A minimap bindings for the find and replace package  
minimap-git-diff - A minimap binding for the git diff package  
minimap-highlight-selected - A minimap binding for the highlight-selected package  
minimap-selection - Display the buffer's selections on the minimap  
monokai - A monokai syntax theme for Atom  
project-palette-finder - Finds and archive colors defined in a project's less/sass/stylus files  
sublime-tabs - Sublime-style tabs  
tabs-to-spaces - Provides the ability to convert between leading tabs and spaces in a document

*(other sources)*  
bash-git-prompt - Informative git prompt for bash  
Sublime Package Control - Sublime Text package manager

**Configurations:**  
Due to [running npm with root cause permission problems](http://stackoverflow.com/questions/18212175/npm-yo-keeps-asking-for-sudo-permission), set prefix to ~/.node where sudo isn't required  
Changes theme to ambiance  
Adds default .jshintrc to the home directory (from this repo)  
Adds default .jscsrc to the home directory (from this repo)  
Instead of installing Docker from Ubuntu repository, add and install from official Docker repository, due to it being the latest version  
Add current user to docker group to allow usage without using sudo  
Show 12h AM/PM clock at the top bar (including day abbreviation, date, seconds)  
Add minimize and maximize back  
Allows workspaces on multiple monitors  
Changes favorite apps to nautilus, chromium, firefox, sublime, terminal  
For gedit, only show tabs if there is more than one tab, show lines numbers, disable word wrap, change tab size to 4, and prevents backup copies (suffixed with "~" that can cause problems when editing system settings)  
For git, sets meld as the diff/merge tool, sets sublime as the core editor, shows color, changes user name/email, prevent creation of .orig files that muck everything up, sets push mode to simple, and set the tab length of git pager to 4  
For bash-git-prompt, change the unicode symbols and PS1 style  
For Nautilus, disable recursive searching  
Creates a ssh key  
Disabled middle click paste  
Enable Ctrl+Alt+Backspace to kill the xserver  
