#!/bin/bash

# Looks for custom placeholders like __SOMETHING__ in README files.

DISABLED=Y

if [ "$DISABLED" == "Y" ]; then
    exit 0
fi

# Temporary override to skip checks
if [ "$ALLOW_PLACEHOLDERS" == "Y" ]; then
    exit 0
fi

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

git diff --cached | grep -E -i -q '^[+].*\b__[A-Z0-9]+[A-Z0-9_]*__\b'

if [ $? -eq 0 ]; then
    echo ""
    errormsg "[F12] README placeholders found"
    NO_ERRORS=1
fi

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
