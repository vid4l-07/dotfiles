#!/bin/bash

pokemon=$(ls ~/.config/bin/pokemon/images | shuf -n 1 )

/bin/cat ~/.config/bin/pokemon/images/$pokemon
