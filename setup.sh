#!/bin/bash

#bspwm

sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev

cd $HOME/Descargas/
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm/
make
sudo make install
cd ../sxhkd/
make
sudo make install

sudo apt install bspwm

#polybar

sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

cd $HOME/Descargas
git clone --recursive https://github.com/polybar/polybar
cd polybar/
mkdir build
cd build/
cmake ..
make -j$(nproc)
sudo make install

#picom

sudo apt update

sudo apt install libpcre3-dev meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev

cd $HOME/Descargas
git clone https://github.com/ibhagwan/picom.git
cd picom/
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

#bspwm
cp -r dotfiles/bspwm ~/.config/
chmod +x ~/.config/bspwm/bspwmrc

cp -r dotfiles/sxhkd ~/.config/

#rofi
sudo apt install rofi

#fonts
sudo cp dotfiles/fonts* /usr/local/share/fonts/
sudo unzip /usr/local/share/fonts/*
sudo fc-cache -v


#wallpaper
sudo apt install feh

#bin
cp -r dotfiles/bin ~/.config/

#zshrc
cp dotfiles/zshrc ~/.zshrc
chmod +x ~/.zshrc

#config polybar
cp -r dotfiles/polybar ~/.config/

#picom
cp -r dotfiles/picom ~/.config/

#rofi
cp -r dotfiles/rofi ~/.config/

#p10k
cp -r dotfiles/powerlevel10k ~/.config
cp dotfiles/p10k.zsh ~/.p10k.zsh
chmod +x ~/.p10k.zsh

#nvim
cp dotfiles/vimrc ~/.vimrc
chmod +x ~/.vimrc

cp -r dotfiles/vim ~/.vim

sudo apt intall nvim
cp -r dotfiles/nvim ~/.config/
cp -r dotfiles/nvim ~/.config/

#kitti
sudo apt install kitti
cp -r dotfiles/kitti ~/.config/
