#!/usr/bin/env bash

clean_up () {
    ARG=$?
    echo "> cleaning up"
    rm -rf ${CONF_DIR}
    exit $ARG
}
trap clean_up ERR

apt-get -y update
apt-get -y upgrade
apt-get install sudo -y
sudo apt-get install zsh -y
sudo apt install git -y
sudo apt install build-essential -y
sudo apt install wget -y
sudo apt install curl -y
sudo apt install cmake -y
sudo apt install unzip -y
sudo apt install tmux -y

NVIM_SRC=${HOME}/nvim-0.91 
CUR_DIR=$(pwd)
CONFIG_DIR=${CUR_DIR}/vimrc/configs

# clone config repo
git clone https://github.com/akshitpatel01/vimrc.git

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ${HOME}/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd -
# powerlevel 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

cp ${CONFIG_DIR}/zshrc ${HOME}/.zshrc
cp ${CONFIG_DIR}/zsh_remaps.zsh ${SZSH_CUSTOM}/
chsh -s $(which zsh)


#install nvim 0.91
mkdir -p ${NVIM_SRC}
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -P ${NVIM_SRC}
cd ${NVIM_SRC}
tar -xvzf nvim-linux64.tar.gz
echo "alias nvim=${NVIM_SRC}/nvim-linux64/bin/nvim" >> ${HOME}/.zshrc
cd -
mkdir -p ${HOME}/.config/nvim
cp -r ${CONFIG_DIR}/nvim ${HOME}/.config/
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install tmux
cp ${CONFIG_DIR}/tmux.conf ${HOME}/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


