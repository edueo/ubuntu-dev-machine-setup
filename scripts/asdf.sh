#!/usr/bin/env sh
ASDF_VERSION=$(curl -s "https://api.github.com/repos/asdf-vm/asdf/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
echo "https://github.com/asdf-vm/asdf/releases/latest/download/asdf-v${ASDF_VERSION}-linux-amd64.tar.gz"
curl -Lo asdf.tar.gz "https://github.com/asdf-vm/asdf/releases/latest/download/asdf-v${ASDF_VERSION}-linux-amd64.tar.gz"
tar xf asdf.tar.gz asdf
rm -rf asdf.tar.gz
sudo mv asdf /usr/local/bin