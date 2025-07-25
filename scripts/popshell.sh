#!/usr/bin/env sh

git clone https://github.com/pop-os/shell.git
cd shell
git checkout master_noble
make local-install
