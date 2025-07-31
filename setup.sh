#!/bin/bash

sudo apt update
sudo apt install -y build-essential ninja-build meson git vim libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev ninja-build nodejs

mkdir content

mkdir ~/.config

cp -r ./dotfiles-bspwm/bin ~/.config

#bspwm
echo 'instalando bspwm y sxhkd'
sleep 1
cd ./content
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm/
make
sudo make install
cd ../sxhkd/
make
sudo make install

sudo apt install -y bspwm

cd ../..

cp -r ./dotfiles-bspwm/bspwm ~/.config
cp -r ./dotfiles-bspwm/sxhkd ~/.config

#polybar
echo 'instalando polybar'
sleep 1
cd ./content
git clone --recursive https://github.com/polybar/polybar
cd polybar/
mkdir build
cd build/
cmake ..
make -j$(nproc)
sudo make install
cd ../..

echo 'actualizando e instalando mas paquetes'
sleep 1
sudo apt update
sudo apt install -y libpcre3-dev libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev

#picom
echo 'instalando picom'
cd ./content
git clone https://github.com/ibhagwan/picom.git
cd picom/
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ../..

echo 'instalando extras y las nerd fonts'
sleep 1
sudo apt install -y rofi feh kitty neovim bat

cp ./dotfiles-bspwm/fonts/* /usr/local/share/fonts/
unzip /usr/local/share/fonts/*
rm /usr/local/share/fonts/*.zip
cp /usr/local/share/fonts/* /usr/share/fonts/truetype/
fc-cache -v

cp -r ./dotfiles-bspwm/polybar ~/.config
cp -r ./dotfiles-bspwm/picom ~/.config
cp -r ./dotfiles-bspwm/rofi ~/.config

rm -r ~/.config/kitty
cp -r ./dotfiles-bspwm/kitty ~/.config
rm ~/.zshrc
cp ./dotfiles-bspwm/.zshrc ~
cp ./dotfiles-bspwm/.p10k.zsh ~
cp -r ./dotfiles-bspwm/powerlevel10k ~/.config

rm -r ~/.vim ~/.vimrc
cp -r ./dotfiles-bspwm/.vim ~
cp ./dotfiles-bspwm/.vimrc ~
cp -r ./dotfiles-bspwm/nvim ~/.config
