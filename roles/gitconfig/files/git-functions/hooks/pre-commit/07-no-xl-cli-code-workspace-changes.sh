#!/bin/bash

# Temporary override to skip checks
if [ "$ALLOW_XLCLI" == "Y" ]; then
    exit 0
fi

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

git status --porcelain | grep -E -q '^M. xl-cli.code-workspace$'

if [ $? -eq 0 ]; then
    echo ""
    errormsg "[F07] Will not commit changes to xl-cli project's xl-cli.code-workspace"
    errormsg "[F07] Use 'ALLOW_XLCLI=Y' to override"
    NO_ERRORS=1
fi

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
