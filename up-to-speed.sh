#!/bin/bash
if (( EUID == 0 )); then
    echo "You must NOT be root to run this." 1>&2
    echo "Why? Preferences are changed for the current user." 1>&2
    echo "If ran as root, those changes will not take place for you, but for root instead." 1>&2
    echo "Also, many files will be owned by root rather than you, messing up permissions." 1>&2
    exit 1
fi

# prevent root from creating ~/tmp/ by creating it ourself and cause permission problems
# Make .node because in the later versions of npm, it's too stupid to make a folder anymore
mkdir ~/tmp/ ~/.node/

echo ""
echo "Please enter your name (for git): "
read name

echo ""
echo "Please enter your email (for git): "
read email

echo ""
echo "Would you like to install tomcat? (Y/n) "
read tomcat

if [ -z "$tomcat" ]; then
	tomcat="Y"
fi
tomcat="${tomcat^^}" #toUpperCase

echo ""
echo "Would you like to install nginx? (Y/n) "
read nginx

if [ -z "$nginx" ]; then
	nginx="Y"
fi
nginx="${nginx^^}" #toUpperCase

echo ""
echo "Would you like to install sublime? (Y/n) "
read sublime

if [ -z "$sublime" ]; then
	sublime="Y"
fi
sublime="${sublime^^}" #toUpperCase

echo ""
echo "Would you like to install atom? (Y/n) "
read atom

if [ -z "$atom" ]; then
	atom="Y"
fi
atom="${atom^^}" #toUpperCase

if [ "$sublime" == "Y" ] && [ "$atom" == "Y" ]; then
	echo ""
	echo "Would you like sublime or atom as your default editor? (A/s) "
	read defaulteditor

	if [ -z "$defaulteditor" ]; then
		defaulteditor="A"
	fi
elif [ "$sublime" == "Y" ]; then
	defaulteditor="S"
elif [ "$atom" == "Y" ]; then
	defaulteditor="A"
else
	defaulteditor="N"
fi

defaulteditor="${defaulteditor^^}" #toUpperCase

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:chris-lea/node.js

if [ "$sublime" == "Y" ]; then
	sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
fi

if [ "$atom" == "Y" ]; then
	sudo add-apt-repository -y ppa:webupd8team/atom
fi

sudo apt-get update
sudo apt-get install -y nautilus-open-terminal light-themes dmz-cursor-theme openjdk-7-jdk openjdk-7-source git meld eclipse maven gparted curl vim chromium-browser

if [ "$sublime" == "Y" ]; then
	sudo apt-get install -y sublime-text-installer
	sudo mv /usr/bin/subl /usr/bin/sublime
	wget https://sublime.wbond.net/Package%20Control.sublime-package -P ~/.config/sublime-text-3/Installed\ Packages
fi

if [ "$atom" == "Y" ]; then
	sudo apt-get install -y atom
	# install one at a time, so that if one failes, all the ones after it don't
	apm install atom-color-highlight
	apm install atom-jshint
	apm install autocomplete-paths
	apm install autocomplete-plus
	apm install color-picker
	apm install editorconfig
	apm install enhanced-package-list
	apm install file-icons
	apm install git-difftool
	apm install minimap
	apm install minimap-color-highlight
	apm install minimap-find-and-replace
	apm install minimap-git-diff
	apm install minimap-highlight-selected
	apm install minimap-selection
	apm install monokai
	apm install project-palette-finder
	apm install sublime-tabs
	apm install tabs-to-spaces
	echo -e "\n'.workspace .editor:not(.mini)':\n  'ctrl-shift-L': 'editor:split-selections-into-lines'" >> ~/.atom/keymap.cson
fi

if [ "$tomcat" == "Y" ]; then
	sudo apt-get install -y tomcat7 tomcat7-admin tomcat7-common tomcat7-docs tomcat7-examples tomcat7-user
fi

if [ "$nginx" == "Y" ]; then
	sudo apt-get install -y nginx
fi

# We want to install nodejs by n. n is installed by npm. npm is installed by nodejs.
# To resolve this cirular dependency, we use apt as the entryway, then run around in a circle
sudo apt-get install -y nodejs              # install node/npm from apt
sudo npm install --prefix=/usr/local/ -g n  # install n
sudo apt-get autoremove --purge -y nodejs   # remove node/npm from apt
sudo n stable                               # install node/npm from n
echo prefix = ~/.node >> ~/.npmrc
echo 'export PATH=$PATH:$HOME/.node/bin' >> ~/.bashrc
echo 'export NODE_PATH=$NODE_PATH:$HOME/.node/lib/node_modules' >> ~/.bashrc
echo 'export PYTHONPATH=$PYTHONPATH:$HOME/.node/lib/node_modules' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/.node/bin' >> ~/.profile
echo 'export NODE_PATH=$NODE_PATH:$HOME/.node/lib/node_modules' >> ~/.profile
echo 'export PYTHONPATH=$PYTHONPATH:$HOME/.node/lib/node_modules' >> ~/.profile
hash -r
source ~/.bashrc
npm install -g --prefix=$(npm config get prefix) less jshint yo bower grunt generator-angular

# If they clone the repo, copy it. If they just downloaded the script, attempt to grab it from github.
[ -f .jshintrc ] && cp .jshintrc ~ || wget https://raw.githubusercontent.com/JonathanGawrych/Linux-up-to-speed/master/.jshintrc -P ~
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
(cd ~/.bash-git-prompt && git reset --hard eb2554395c43287c1ada1544012106b61f8ce3c8)
echo "source ~/.bash-git-prompt/gitprompt.sh" >> ~/.bashrc

gsettings set org.gnome.desktop.wm.preferences theme 'Ambiance'
gsettings set org.gnome.desktop.interface gtk-theme 'Ambiance'
gsettings set org.gnome.desktop.interface cursor-theme 'DMZ-White'
gsettings set org.gnome.desktop.interface clock-format 12h
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.shell.calendar show-weekdate true
gsettings set org.gnome.shell.overrides button-layout ':minimize,maximize,close'
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false

if [ "$defaulteditor" == "A" ]; then
	gsettings set org.gnome.shell favorite-apps "['nautilus.desktop', 'chromium-browser.desktop', 'firefox.desktop', 'atom.desktop', 'gnome-terminal.desktop']"
elif [ "$defaulteditor" == "S" ]; then
	gsettings set org.gnome.shell favorite-apps "['nautilus.desktop', 'chromium-browser.desktop', 'firefox.desktop', 'sublime-text.desktop', 'gnome-terminal.desktop']"
else
	gsettings set org.gnome.shell favorite-apps "['nautilus.desktop', 'chromium-browser.desktop', 'firefox.desktop', 'gnome-terminal.desktop']"
fi

gsettings set org.gnome.gedit.preferences.ui notebook-show-tabs-mode 'auto'
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor wrap-mode 'none'
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor create-backup-copy false
gsettings set org.gnome.nautilus.preferences enable-interactive-search true
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/EnablePrimaryPaste': <0>}"
gsettings set org.gnome.desktop.input-sources xkb-options "['terminate:ctrl_alt_bksp']"

git config --global merge.tool meld
git config --global mergetool.keepBackup false
git config --global diff.tool meld
git config --global --add color.ui true
git config --global push.default simple
git config --global user.email "$email"
git config --global user.name "$name"
git config --global core.pager 'less -x5,9'

if [ "$defaulteditor" == "A" ]; then
	git config --global core.editor "atom -wn"
elif [ "$defaulteditor" == "S" ]; then
	git config --global core.editor "sublime -wn"
fi


ssh-keygen -t rsa -b 2048 -C "$email" -N "" -f ~/.ssh/id_rsa

cp ~/.bash-git-prompt/git-prompt-colors.sh ~/.git-prompt-colors.sh
sed -i -e 's/\xe2\x97\x8f/\xe2\x80\xa2/' -e 's/\xe2\x9c\x96/\xe2\x98\xa2\x20/' -e 's/\xe2\x9c\x9a/\xc2\xb1/' -e 's/\xe2\x9a\x91/\xe2\xad\x91/' -e 's/\xe2\x9a\x91/\xe2\xad\x91/' -e 's/\xe2\x86\x91\xc2\xb7/\xe2\x86\x91/' -e 's/\xe2\x86\x93\xc2\xb7/\xe2\x86\x93/' ~/.git-prompt-colors.sh
printf '\n  GIT_PROMPT_START="$BoldBlue\w$ResetColor"\n  GIT_PROMPT_END=" $ "' >> ~/.git-prompt-colors.sh
