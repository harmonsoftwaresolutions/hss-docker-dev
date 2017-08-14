#!/bin/bash -xe

while true
do
  tail -f /dev/null & wait ${!}
done
