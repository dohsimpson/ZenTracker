#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
file="$DIR/data/"`date "+%Y-%m-%d"`
if [ ! -f "$file" ]; then
    touch "$file"
    exit 1
fi

text=`cat $file`

# while read IN; do
#     echo "$IN"
# done <<< "$text"

function convert_min_to_hour()
{
    read v
    ((hour=$v/60))
    ((min=$v-$hour*60))
    echo ${hour}h:${min}m
}

function do_format()
{
    while read IN; do
        echo -e $(echo "$IN" | cut -d' ' -f 1)"\t"$(echo "$IN" | cut -d' ' -f 2 | convert_min_to_hour)
    done <<< "$1"
}

function on_by_hours()
{
    local v=`echo "$text" | cut -d : -f 1 | sort | uniq -c | sort -nr | sed -E 's/^ *([0-9]+) ([0-9]+) */\2 \1/'`
    echo "$v" | tr '\n' '\t'
    echo
}

function by_application()
{
    local v=`echo "$text" | cut -f 2 | sort | uniq -c | sort -nr | sed -E 's/^ *([0-9]+) (.+) */\2 \1/'`
    do_format "$v"
}

function total_time()
{
    wc -l <<< "$text" | convert_min_to_hour
}

function details()
{
    echo "$text"
}

p=""
p="$p""Total Time: `total_time`""\n"
p="$p""By Hours: ""\n"
p="$p`on_by_hours`""\n"
p="$p""By Applications: ""\n"
p="$p`by_application`""\n"
p="$p""----------""\n"
p="$p`details`""\n"
echo -e "$p" | less
