#!/bin/bash

# prompt for entering the image name
read -p "Enter image name: " image

# change directory to the Downloads folder
cd /Users/manfred.specht/Downloads

# attach the image
hdiutil attach <image>.dmg

# copy the image to the Applications folder
sudo cp -R /Vulumes/$image/$image.app /Applications

# detach the image
hdiutil detach /Volumes/$image
