#!/bin/bash
if (( EUID == 0 )); then
    echo "You must NOT be root to run this." 1>&2
    echo "Why? Preferences are changed for the current user." 1>&2
    echo "If ran as root, those changes will not take place for you, but for root instead." 1>&2
    echo "Also, many files will be owned by root rather than you, messing up permissions." 1>&2
    exit 1
fi

# prevent root from creating ~/tmp/ by creating it ourself and cause permission problems
mkdir ~/tmp/

echo ""
echo "Please enter your name: "
read name

echo ""
echo "Please enter your email: "
read email

echo ""
echo "Would you like to install tomcat? (Y (default)/N)"
read tomcat

if [ -z "$tomcat" ]
	then tomcat="Y"
fi

echo ""
echo "Do you want Sublime, Atom, Both, or Neither? (S/A/B (default)/N)"
read editor

if [ -z "$editor" ]
	then editor="B"
fi

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:chris-lea/node.js
if [ "$editor" == "S" ] || [ "$editor" == "B" ] || [ "$editor" == "s" ] || [ "$editor" == "b" ]
	then sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
fi
if [ "$editor" == "A" ] || [ "$editor" == "B" ] || [ "$editor" == "a" ] || [ "$editor" == "b" ]
	then sudo add-apt-repository -y ppa:webupd8team/atom
fi
sudo apt-get update
sudo apt-get install -y nautilus-open-terminal light-themes dmz-cursor-theme openjdk-7-jdk git meld eclipse maven gparted curl vim chromium-browser

if [ "$editor" == "S" ] || [ "$editor" == "B" ] || [ "$editor" == "s" ] || [ "$editor" == "b" ]
	then sudo apt-get install -y sublime-text-installer
fi
if [ "$editor" == "A" ] || [ "$editor" == "B" ] || [ "$editor" == "a" ] || [ "$editor" == "b" ]
	then sudo apt-get install -y atom
fi
if [ "$tomcat" == "Y" ] || [ "$tomcat" == "y" ]
	then sudo apt-get install -y tomcat7 tomcat7-admin tomcat7-common tomcat7-docs tomcat7-examples tomcat7-user
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
npm install -g --prefix=$(npm config get prefix) less jshint@2.4.4 yo bower grunt generator-angular

# Atom packes
if [ "$editor" == "A" ] || [ "$editor" == "B" ] || [ "$editor" == "a" ] || [ "$editor" == "b" ]
	then apm install color-picker linter linter-jshint css-color-highlight emmet editorconfig file-icons minimap minimap-git-diff minimap-color-hilight image-view git-difftool autocomplete-plus autocomplete-snippets autocomplete-paths
fi

# If they clone the repo, copy it. If they just downloaded the script, attempt to grab it from github.
[ -f .jshintrc ] && cp .jshintrc ~ || wget https://raw.githubusercontent.com/JonathanGawrych/Linux-up-to-speed/master/.jshintrc -P ~
wget https://sublime.wbond.net/Package%20Control.sublime-package -P ~/.config/sublime-text-3/Installed\ Packages
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
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
gsettings set org.gnome.shell favorite-apps "['nautilus.desktop', 'chromium-browser.desktop', 'firefox.desktop', 'sublime-text.desktop', 'gnome-terminal.desktop']"
gsettings set org.gnome.gedit.preferences.ui notebook-show-tabs-mode 'auto'
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor wrap-mode 'none'
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor create-backup-copy false
gsettings set org.gnome.nautilus.preferences enable-interactive-search true
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/EnablePrimaryPaste': <0>}"
gsettings set org.gnome.desktop.input-sources xkb-options "['terminate:ctrl_alt_bksp']"

git config --global merge.tool meld
git config --global diff.tool meld
git config --global --add color.ui true
git config --global user.email "$email"
git config --global user.name "$name"
git config --global core.editor "sublime -wn"
git config --global mergetool.keepBackup false
git config --global push.default simple

ssh-keygen -t rsa -b 2048 -C "$email" -N "" -f ~/.ssh/id_rsa

cp ~/.bash-git-prompt/git-prompt-colors.sh ~/.git-prompt-colors.sh
sed -i -e 's/\xe2\x97\x8f/\xe2\x80\xa2/' -e 's/\xe2\x9c\x96/\xe2\x98\xa2\x20/' -e 's/\xe2\x9c\x9a/\xc2\xb1/' -e 's/\xe2\x9a\x91/\xe2\xad\x91/' -e 's/\xe2\x9a\x91/\xe2\xad\x91/' -e 's/\xe2\x86\x91\xc2\xb7/\xe2\x86\x91/' -e 's/\xe2\x86\x93\xc2\xb7/\xe2\x86\x93/' ~/.git-prompt-colors.sh
printf '\n  GIT_PROMPT_START="$BoldBlue\w$ResetColor"\n  GIT_PROMPT_END=" $ "' >> ~/.git-prompt-colors.sh

sudo mv /usr/bin/subl /usr/bin/sublime
