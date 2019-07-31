#!/bin/bash
set -eu

curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz | tar -zxf - --strip=1 -C ./nvim_bin

