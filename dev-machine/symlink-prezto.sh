#!/bin/bash
for rcfile in $HOME/.zprezto/runcoms/*; do
  ln -s "$rcfile" "$HOME/.${rcfile:t}"
done
