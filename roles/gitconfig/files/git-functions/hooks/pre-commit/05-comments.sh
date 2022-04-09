#!/bin/bash

# Looks for comments like # TODO in all files.

DISABLED=Y

if [ "$DISABLED" == "Y" ]; then
    exit 0
fi

# Temporary override to skip comments checks
if [ "$ALLOW_COMMENTS" == "Y" ]; then
    exit 0
fi

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

git diff --cached | grep -E -i -q '\+ *# *(!|\?)'

if [ $? -eq 0 ]; then
    echo ""
    errormsg "[F05] #! or #? comment found"
    errormsg "[F05] Use ALLOW_COMMENTS=Y to override"
    NO_ERRORS=1
fi

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
