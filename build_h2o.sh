#!/usr/bin/env bash

echo "BUILDING H2O from the future"
mkdir pkg 
cd pkg
git clone https://github.com/yannick/h2o-kafka-pkgbuild.git
cd h2o-kafka-pkgbuild
sudo pacman -S --noconfirm --needed libyaml wslay ruby
makepkg -si
