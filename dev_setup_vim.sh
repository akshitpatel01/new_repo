#!/bin/bash

clean_up () {
    ARG=$?
    echo "> cleaning up"
    rm -rf ~/.conf
    exit $ARG
}
trap clean_up ERR

CONF_DIR=${HOME}/.conf
DOTFILE_SRC=${CONF_DIR}/dotfiles

mkdir -p ${CONF_DIR}
cd ${CONF_DIR}

sudo apt install git
sudo apt install tmux
git clone https://github.com/akshitpatel01/vimrc.git ${DOTFILE_SRC}

ln -s ${DOTFILE_SRC}/vimrc vimrc
ln -s ${DOTFILE_SRC}/tmux.conf tmux.conf 




ln -s ${CONF_DIR}/tmux.conf ${HOME}/.tmux.conf
ln -s ${CONF_DIR}/vimrc ${HOME}/.vimrc


# set source paths



# sartup first session
# tmux new -s code






