#!/usr/bin/env bash

clean_up () {
    ARG=$?
    echo "> cleaning up"
    rm -rf ${CONF_DIR}
    exit $ARG
}
trap clean_up ERR

CONF_DIR=${HOME}/.user_conf
DOTFILE_SRC=${CONF_DIR}/dotfiles

if [ -e ${CONF_DIR} ] 
then
    echo "Conf directory already exists. Using the curent one"
    rm ${CONF_DIR}/vimrc
    rm ${CONF_DIR}/tmux.conf
else
    echo "Creating the conf directory"
    mkdir ${CONF_DIR}
    git clone https://github.com/akshitpatel01/vimrc.git ${DOTFILE_SRC}
fi
cd ${CONF_DIR}

sudo apt install -y git
sudo apt install -y tmux
sudo apt install -y cscope

ln -s ${DOTFILE_SRC}/vimrc vimrc
ln -s ${DOTFILE_SRC}/tmux.conf tmux.conf 
ln -s ${DOTFILE_SRC}/colorschemes color/  
mkdir -p ${HOME}/.vim/colors
for filename in ${DOTFILE_SRC}/colorschemes/*.vim do
    if [ -e ${HOME}/.vim/colors/$filename ]
    then
        echo "Colorscheme $filename already exists"
    else
       ln -s ${HOME}/.vim/colors/$filename ${DOTFILE_SRC}/colorschemes/$filename
    fi
done

# set source paths

if [[ -e ${HOME}/.tmux.conf || -e ${HOME}/.vimrc ]]
then 
	echo  "Tmux/vimrc file already exists"
    read -p "Do you want to replace the curent conf file(y/n): " user_input
    if [ $user_input == "y" ]
    then 
        echo "Moving exisintg conf files to _old suffix"
        mv ${HOME}/.tmux.conf ${HOME}/.tmux.conf_old
        mv ${HOME}/.vimrc ${HOME}/.vimrc_old
        ln -s ${CONF_DIR}/tmux.conf ${HOME}/.tmux.conf
        ln -s ${CONF_DIR}/vimrc ${HOME}/.vimrc
    else
        read -p "Do you want to continue with current configs(y/n): " user_input
        if [ $user_input == "n" ]
        then
            return 0;
        fi
    fi
else
	echo  "Tmux and vimrc file does not exist. Creating new one"
    ln -s ${CONF_DIR}/tmux.conf ${HOME}/.tmux.conf
    ln -s ${CONF_DIR}/vimrc ${HOME}/.vimrc

fi

# sartup first session
cd -
cscope -Rb

if tmux ls | grep "code" ; 
then 
    read -p "Do you want to overwrite the current session with new session(y/n): " user_input
    if [ $user_input == "n" ]
    then
        tmux source ${HOME}/.tmux.conf
        tmux a -t code; 
        exit 1;
    else 
        tmux kill-session -t code
    fi
fi
tmux new -d -s code
tmux send 'vim . -c "cs add cscope.out"' ENTER;
tmux split-window -v
tmux resize-pane -D 15
tmux split-window -h
tmux send 'htop' ENTER;
tmux select-pane -U
tmux a -t code
