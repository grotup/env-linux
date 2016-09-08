#!/bin/bash
#
# env-linux automated application installer 
#
# Simply run this command and you're ready to go
#   TODO : curl -sS http://gitlab.mgdis.fr/lebideau-e/env-linux/...... | sh
#   
#


REPO="gitlab@gitserv:lebideau-e/env-linux.git"
DEST="$HOME/.env-linux"

if [ -e /etc/debian_version ]; then
  if ! which npm | grep -s -q "/npm"
  then
    sudo apt-get install -y npm
  fi
  if ! which git | grep -s -q "/git"
  then
    sudo apt-get install -y git
  fi
  if ! which curl | grep -s -q "/curl"
  then
    sudo apt-get install -y curl
  fi
  if ! which xsel | grep -s -q "/xsel"
  then
    sudo apt-get install -y xsel
  fi
  if ! which vim | grep -s -q "/vim"
  then
    sudo apt-get install -y vim
  fi
else
  echo "ERROR   : Failed, use debian version (/etc/debian_version)"
  exit 1
  
fi

#echo "Installing 'grunt' (requires sudo)"
#sudo npm install -g grunt-cli


cd $HOME

if [ -d "$DEST" ]; then
  echo "WARNING : Failed, destination already exists"
else
  mkdir -p $DEST
  echo "INFO    : Downloading env-linux"
  git clone --recursive $REPO $DEST
fi

#echo "Building"
#cd $DEST
#npm install
#grunt

echo "INFO     : INSTALLATION COMPLETE :-)"
echo "INFO     : Look at INSTALL.md for documentation on how to start the a server"
