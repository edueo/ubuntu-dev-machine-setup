#!/usr/bin/env sh
curl -Lo mongocompass.deb "https://downloads.mongodb.com/compass/mongodb-compass_1.46.2_amd64.deb"
sudo dpkg -i mongocompass.deb
rm -rf mongocompass.deb