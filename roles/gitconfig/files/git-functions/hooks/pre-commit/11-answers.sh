#!/bin/bash

# Temporary override to skip checks
if [ "$IGNORE_ANSWERS" == "Y" ]; then
    exit 0
fi

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

ANSWER_FILES=$(git status --porcelain | grep -v __test__ | grep -E '^A. .*answer.*ya?ml')

if [ $? -eq 0 ]; then
    echo ""
    errormsg "[F11] Cannot commit with these answer files present:"
    while read ANSWER_FILE; do
        errormsg "$ANSWER_FILE"
    done <<< "$(echo "${ANSWER_FILES}")"
    NO_ERRORS=1
fi

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
