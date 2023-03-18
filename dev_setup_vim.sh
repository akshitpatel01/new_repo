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
VIM_SRC=${HOME}/.vim/
NVIM_SRC=${HOME}/.config/nvim
TMUX_SRC=${HOME}

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
sudo apt install -y vim

ln -s ${DOTFILE_SRC}/vimrc vimrc
ln -s ${DOTFILE_SRC}/nvim nvim
ln -s ${DOTFILE_SRC}/tmux.conf tmux.conf 
ln -s ${DOTFILE_SRC}/colorschemes color  

mkdir -p ${VIM_SRC}/colors
mkdir -p ${NVIM_SRC}/colors
for filename in ${DOTFILE_SRC}/colorschemes/*.vim
do
    name=${filename##*/}
    if [[ -e ${VIM_SRC}/colors/$name ]]
    then
        echo "Colorscheme $name already exists"
    else
       ln -s ${DOTFILE_SRC}/colorschemes/$name ${VIM_SRC}/colors/$name
    fi
    # nvim 
    if [[ -e ${NVIM_SRC}/colors/$name ]]
    then
        echo " Nvim Colorscheme $name already exists"
    else
       ln -s ${DOTFILE_SRC}/colorschemes/$name ${NVIM_SRC}/colors/$name
    fi
done

# set source paths

if [[ -e ${HOME}/.tmux.conf || -e ${HOME}/.vimrc || -e ${NVIM_SRC}/init.vim ]]
then 
	echo  "Tmux/vimrc file already exists"
    read -p "Do you want to replace the curent conf file(y/n): " user_input
    if [ $user_input == "y" ]
    then 
        echo "Moving exisintg conf files to _old suffix"
        mv ${HOME}/.tmux.conf ${HOME}/.tmux.conf_old
        mv ${HOME}/.vimrc ${HOME}/.vimrc_old
        mv ${NVIM_SRC}/init.vim ${NVIM_SRC}/init.vim_old
        ln -s ${CONF_DIR}/tmux.conf ${HOME}/.tmux.conf
        ln -s ${CONF_DIR}/vimrc ${HOME}/.vimrc
        ln -s ${CONF_DIR}/nvim/init.vim ${NVIM_SRC}/init.vim
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
    ln -s ${CONF_DIR}/nvim/init.vim ${NVIM_SRC}/init.vim

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
tmux send 'nvim . -c "cs add cscope.out"' ENTER;
tmux split-window -v
tmux resize-pane -D 15
tmux split-window -h
tmux send 'htop' ENTER;
tmux select-pane -U
tmux a -t code
