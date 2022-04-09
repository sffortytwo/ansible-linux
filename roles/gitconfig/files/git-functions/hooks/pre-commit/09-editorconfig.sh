#!/bin/bash

# Temporary override to skip checks
if [ "$ALLOW_EDITORCONFIG" == "Y" ]; then
    exit 0
fi

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

git status --porcelain | grep -E -q '^M. \.editorconfig$'

if [ $? -eq 0 ]; then
    echo ""
    errormsg "[F09] Will not commit changes to .editorconfig file"
    NO_ERRORS=1
fi

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
