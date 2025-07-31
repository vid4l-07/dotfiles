#!/bin/bash

#Walppapers
purplewp=${HOME}/datos_lin/fotos/7.jpg
japanwp=${HOME}/datos_lin/fotos/6.jpg
bluewp=${HOME}/datos_lin/fotos/9.jpg

#polybars
purplepoly=${HOME}/.config/polybar/purple
greypoly=${HOME}/.config/polybar/grey
bluepoly=${HOME}/.config/polybar/blue

#rofi app
purpleapp=${HOME}/.config/rofi/themes/purple.rasi
greyapp=${HOME}/.config/rofi/themes/nord.rasi
blueapp=${HOME}/.config/rofi/themes/nord.rasi

#rofi ip
purpleip=${HOME}/.config/rofi/themes/purpleip.rasi
greyip=${HOME}/.config/rofi/themes/nordip.rasi
blueip=${HOME}/.config/rofi/themes/nordip.rasi

if [[ $1 = --help ]];then
	echo '
 =======THEMES=======

 -p -> purple theme 
 -g -> grey theme
 -b -> blue theme'
fi


if [[ $1 = -p ]];then
	echo $purplewp > ${HOME}/.config/bin/wallpaper
	echo $purplepoly > ${HOME}/.config/bin/polybar
	echo '@theme '\"$purpleapp\" > ${HOME}/.config/rofi/config.rasi
	echo $purpleip > ${HOME}/.config/rofi/themeip

elif [[ $1 = -g ]];then
	echo $japanwp > ${HOME}/.config/bin/wallpaper
	echo $greypoly > ${HOME}/.config/bin/polybar
	echo '@theme '\"$greyapp\" > ${HOME}/.config/rofi/config.rasi
	echo $greyip > ${HOME}/.config/rofi/themeip

elif [[ $1 = -b ]];then
	echo $bluewp > ${HOME}/.config/bin/wallpaper
	echo $bluepoly > ${HOME}/.config/bin/polybar
	echo '@theme '\"$blueapp\" > ${HOME}/.config/rofi/config.rasi
	echo $blueip > ${HOME}/.config/rofi/themeip
	

fi
