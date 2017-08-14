#!/bin/bash -xe

for rcfile in $HOME/.zprezto/runcoms/*; do
  ln -s "$rcfile" ".$(basename $rcfile)"
done
