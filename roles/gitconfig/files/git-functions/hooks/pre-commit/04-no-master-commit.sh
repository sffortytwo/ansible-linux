#!/bin/bash

ALLOW_MASTER=Y

# Temporary override to skip checks
if [ "$ALLOW_MASTER" == "Y" ]; then
    exit 0
fi

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

BRANCH=$(git branch | awk '/^\*/ { print $2 }')

if [ "$BRANCH" == "master" ]; then
    echo ""
    errormsg "[F04] Commits to master branch are not allowed"
    errormsg "[F04] Use ALLOW_MASTER=Y to override"
    NO_ERRORS=1
fi

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
