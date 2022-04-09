#!/bin/bash

BASEDIR=$HOME/.git-functions/hooks/pre-commit

NO_ERRORS=0
for func in $(ls $BASEDIR); do
    $BASEDIR/$func $@
    if [ $? -ne 0 ]; then
        NO_ERRORS=1
    fi
done

source $HOME/.git-functions/hooks/shared.sh

if [ $NO_ERRORS -ne 0 ]; then
    echo "" >&2
    errormsg "There were pre-commit failures"
    exit 1
fi
