#!/bin/bash

MAX_MINUTES=60
cat ~enting/.zentracker/$(date +%Y-%m-%d) | awk '{print $2}' | grep 'Dash\|iTerm2' | wc -l | xargs test $MAX_MINUTES -lt && EXCEEDED=1
cat ~enting/.zentracker/$(date +%Y-%m-%d) | tail -n1 | awk '{print $2}' | grep 'Dash\|iTerm2' | wc -l | xargs test 1 -eq && CURRENT=1  # sometimes there's a 1 minute delay when this cron job is run before zentrackerd put a new line

if test -n "$EXCEEDED" -a -n "$CURRENT"; then
  osascript -e beep && osascript -e 'display notification "'"cond: developer time > 1 hr"'" with title "Life Balance"'
fi
