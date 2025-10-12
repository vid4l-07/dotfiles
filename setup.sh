#!/bin/bash

ruta=$(pwd)

sudo apt update
sudo apt install -y bspwm build-essential ninja-build meson cmake git vim libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev ninja-build nodejs xcb-proto libcairo2-dev libfontconfig1-dev pkgconf pwdsphinx python3-sphinx python3-xcbgen playerctl pulseaudio i3lock-fancy alsa-utils
sudo apt install -y libpcre3-dev libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libcurl4-openssl-dev libiw-dev libmpdclient-dev libnl-genl-3-dev libpulse-dev libxcb-xkb-dev

mkdir content

mkdir ~/.config

cp -r ./config/bin ~/.config

#bspwm
echo "\n instalando bspwm y sxhkd\n"
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

cd $ruta

cp -r ./config/bspwm ~/.config
cp -r ./config/sxhkd ~/.config

#polybar
echo "\n instalando polybar \n"
sleep 1
cd ./content
git clone --recursive https://github.com/polybar/polybar
cd polybar/
mkdir build
cd build/
cmake ..
make -j$(nproc)
sudo make install
cd $ruta

cp ~/.config/bin/spotify_status.py ~/.local/bin

#picom
echo "\n instalando picom \n"
cd ./content
git clone https://github.com/ibhagwan/picom.git
cd picom/
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd $ruta

echo "\ninstalando extras y las nerd fonts\n"
sleep 1
sudo apt install -y rofi feh kitty neovim bat

mkdir -p ~/.local/share/fonts
cp ./config/fonts/*.zip ~/.local/share/fonts
cd ~/.local/share/fonts
unzip -o '*.zip'
rm *.zip README.md LICENSE*
fc-cache -fv
cd $ruta

sudo mkdir /usr/share/fonts/nerd
sudo cp ./config/fonts/*.zip /usr/share/fonts/nerd/
cd /usr/share/fonts/nerd/
sudo unzip -o '*.zip'
sudo rm *.zip README.md LICENSE*
sudo fc-cache -fv
cd $ruta

cp -r ./config/polybar ~/.config
cp -r ./config/picom ~/.config
cp -r ./config/rofi ~/.config

rm -r ~/.config/kitty 2> /dev/null
cp -r ./config/kitty ~/.config
rm ~/.zshrc 2> /dev/null
cp ./config/.zshrc ~
cp ./config/.p10k.zsh ~
cp -r ./config/powerlevel10k ~/.config

rm -r ~/.vim ~/.vimrc 2> /dev/null
cp -r ./config/.vim ~
cp ./config/.vimrc ~
cp -r ./config/nvim ~/.config
cp -r ./config/coc ~/.config

ln -s ~/.config/bin/changetheme.sh ~/.local/bin/changetheme

bash ~/.config/bin/changetheme.sh -d
