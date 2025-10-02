#!/bin/bash

#Walppapers
purplewp=${HOME}/.config/bin/wallpapers/7.jpg
japanwp=${HOME}/.config/bin/wallpapers/6.jpg
bluewp=${HOME}/.config/bin/wallpapers/9.jpg
blackwp=${HOME}/.config/bin/wallpapers/15.png

#polybars
purplepoly=${HOME}/.config/polybar/purple
bluepoly=${HOME}/.config/polybar/blue
greypoly=${HOME}/.config/polybar/grey
blackpoly=${HOME}/.config/polybar/black

#rofi app
purpleapp=${HOME}/.config/rofi/themes/purple.rasi
greyapp=${HOME}/.config/rofi/themes/nord.rasi
blueapp=${HOME}/.config/rofi/themes/nord.rasi

#rofi ip
purpleip=${HOME}/.config/rofi/themes/purpleip.rasi
greyip=${HOME}/.config/rofi/themes/nordip.rasi
blueip=${HOME}/.config/rofi/themes/nordip.rasi

#kitty
greykitty=${HOME}/.config/kitty/blue.ini
blackitty=${HOME}/.config/kitty/black.ini

#vim
bluevim="colorscheme nord \\n let g:airline_theme = 'nord'"
blackvim="colorscheme atelier_cave \\n let g:airline_theme = 'base16_atelier_cave'"


function kitty() {
	rm ${HOME}/.config/kitty/color.ini
	cp $1 ${HOME}/.config/kitty/color.ini
}


if [[ $1 = --help || $1 = '' ]];then
	echo '
 =======THEMES=======

 -p -> purple theme 
 -g -> grey theme
 -b -> blue theme
 -d -> dark theme'
fi


if [[ $1 = -p ]];then
	echo $purplewp > ${HOME}/.config/bin/wallpaper
	echo $purplepoly > ${HOME}/.config/bin/polybar
	echo '@theme '\"$purpleapp\" > ${HOME}/.config/rofi/config.rasi
	echo $purpleip > ${HOME}/.config/rofi/themeip

elif [[ $1 = -b ]];then
	echo $bluewp > ${HOME}/.config/bin/wallpaper
	echo $bluepoly > ${HOME}/.config/bin/polybar
	echo '@theme '\"$blueapp\" > ${HOME}/.config/rofi/config.rasi
	echo $blueip > ${HOME}/.config/rofi/themeip

elif [[ $1 = -g ]];then
	echo $japanwp > ${HOME}/.config/bin/wallpaper
	echo $greypoly > ${HOME}/.config/bin/polybar
	echo '@theme '\"$greyapp\" > ${HOME}/.config/rofi/config.rasi
	echo $greyip > ${HOME}/.config/rofi/themeip
	kitty $greykitty
	echo -e $bluevim > ${HOME}/.config/nvim/theme.vim

elif [[ $1 = -d ]];then
	echo $blackwp > ${HOME}/.config/bin/wallpaper
	echo $blackpoly > ${HOME}/.config/bin/polybar
	kitty $blackitty
	echo -e $blackvim > ${HOME}/.config/nvim/theme.vim
fi
