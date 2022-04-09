#!/bin/bash

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

BRANCH=$(git branch | awk '/^\*/ { print $2 }' | sed 's/^\(LOVE-[0-9]\{1,\}\).*$/\1/')

if [[ "$BRANCH" =~ ^LOVE-[0-9][0-9]*$ ]]; then
    if ! grep -q "^${BRANCH} " $1; then
        errormsg "Commit message missing '$BRANCH' prefix"
        NO_ERRORS=1
    fi
fi

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
