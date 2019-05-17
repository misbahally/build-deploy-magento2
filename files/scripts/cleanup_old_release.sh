#!/bin/bash

for release in `find $1 -maxdepth 1 -mindepth 1 -type d | egrep -v "$(readlink $1/current)|current"`; do
    rm -f -v $release/pub/media $release/var
    if [ ! $? -eq 0 ]; then
        echo "Ignore $release"
        continue
    else		
        echo "Removing $release"
        rm  -rf $release
    fi

done
