#!/bin/bash

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

GO_FILES=$(git status --porcelain | grep -E '\.go$' | sed 's/^...//')

if [ -n "${GO_FILES}" ]; then
    echo "${GO_FILES}" | while read fn; do
        git diff --cached "$fn" | grep -E -q '^\+ '
        if [ $? -eq 0 ]; then
            echo ""
            errormsg "[F08] File ${fn} has space indentation instead of tabs"
            NO_ERRORS=1
        fi
    done
fi

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
