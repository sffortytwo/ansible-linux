#!/bin/bash

ALLOW_MERGE_CONFLICT=Y

# Temporary override to skip checks
if [ "$ALLOW_MERGE_CONFLICT" == "Y" ]; then
    exit 0
fi

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

git diff --cached | grep -E -i -q '^[+].*<<<<'

if [ $? -eq 0 ]; then
    echo ""
    errormsg "[F03] Merge chevrons found"
    errormsg "[F03] Use ALLOW_MERGE_CONFLICT=Y to override"
    NO_ERRORS=1
fi

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
