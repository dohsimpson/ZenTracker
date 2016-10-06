#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# create file
file="$DIR/data/"`date "+%Y-%m-%d"`
if [ ! -f "$file" ]; then
    touch "$file"
fi

# read from applescript
read frontApp
read frontDocument
now=`date "+%H:%M"`
echo -e "$now""\t""$frontApp""\t""$frontDocument" >> "$file"
