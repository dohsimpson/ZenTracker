#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATH="$DIR:$PATH"

function sleep_till_next_min()
{
    local v=`date '+%S'`
    ((sec=60-10#"$v"))
    echo "$sec"

}

echo "ZenTracker is running..."
while true; do
    current_activity.sh | log_activity.sh
    sleep $(sleep_till_next_min)
done
