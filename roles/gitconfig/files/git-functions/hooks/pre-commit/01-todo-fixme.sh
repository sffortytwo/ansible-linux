#!/bin/bash

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
