#!/bin/bash

cd /Users/manfred.specht/Downloads

hdiutil attach <image>.dmg

cd /Volumes/<image>

sudo cp -R ./<image>.app /Applications

hdiutil detach /Volumes/<image>
