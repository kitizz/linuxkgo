# Common installations for Debian-based Linux distros.
# I find these most useful on lightweight systems that don't have a lot of common packages installed.

VIMBIN=$(which vim)
if [ -z $VIMBIN ]
then
    sudo apt-get install vim
fi

GITBIN=$(which git)
if [ -z $GITBIN ]
then
    sudo apt-get install git
fi

PY3=$(which python3)
if [ -z $PY3 ]
then
    sudo apt-get install python3
fi

PIP3=$(which pip3)
if [ -z $PIP3 ]
then
    sudo apt-get install python3-pip
fi