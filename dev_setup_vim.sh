#!/bin/bash

clean_up () {
    ARG=$?
    echo "> cleaning up"
    rm -rf ${CONF_DIR}
    exit $ARG
}
trap clean_up ERR

CONF_DIR=${HOME}/.user_conf
DOTFILE_SRC=${CONF_DIR}/dotfiles

mkdir ${CONF_DIR}
cd ${CONF_DIR}

sudo apt install -y git
sudo apt install -y tmux
sudo apt install -y cscope
git clone https://github.com/akshitpatel01/vimrc.git ${DOTFILE_SRC}

ln -s ${DOTFILE_SRC}/vimrc vimrc
ln -s ${DOTFILE_SRC}/tmux.conf tmux.conf 

# set source paths

ln -s ${CONF_DIR}/tmux.conf ${HOME}/.tmux.conf
ln -s ${CONF_DIR}/vimrc ${HOME}/.vimrc


# sartup first session
cd -
cscope -Rb
tmux new -d -s code
tmux send 'vim .' ENTER;
tmux split-window -v
tmux select-pane -U
tmux resize-pane -L 15
tmux split-window -h
tmux select-pane -R
tnux send 'htop' ENTER;

