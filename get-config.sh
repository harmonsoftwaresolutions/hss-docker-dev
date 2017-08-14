#!/bin/sh

# CONFIG
DIR="./hss-dev-machine/hss-cfg"
if [ -d "$DIR" ]; then
    printf '%s\n' "Removing Lock ($DIR)"
    rm -rf "$DIR"
fi
git clone --recursive https://github.com/harmonsoftwaresolutions/hss-config.git ./hss-dev-machine/hss-cfg

# PREZTO
DIR="./hss-dev-machine/zprezto"
if [ -d "$DIR" ]; then
    printf '%s\n' "Removing Lock ($DIR)"
    rm -rf "$DIR"
fi
git clone --recursive https://github.com/harmonsoftwaresolutions/hss-prezto.git ./hss-dev-machine/zprezto
