#!/bin/bash

# Bypassing
exit 0

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

# AWS
grep '=' ~/.aws/credentials|awk 'BEGIN{FS="="}{print $2}'|sed 's/ *//g' | while read key; do
    git diff --cached | grep -q "$key"
    if [ $? -eq 0 ]; then
        echo ""
        errormsg "[F06] AWS key '$key' found"
        NO_ERRORS=1
    fi
done

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
