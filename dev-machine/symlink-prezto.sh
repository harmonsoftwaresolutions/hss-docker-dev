#!/bin/bash
setopt EXTENDED_GLOB
for rcfile in $HOME/.zprezto/runcoms/*; do
  ln -s "$rcfile" "$HOME/.${rcfile:t}"
done
