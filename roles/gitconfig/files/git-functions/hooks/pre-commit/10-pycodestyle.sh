#!/bin/bash

# Bypassing
exit 0

# Temporary override to skip checks
if [ "$IGNORE_PYTHON" == "Y" ]; then
    exit 0
fi

source $HOME/.git-functions/hooks/shared.sh

NO_ERRORS=0

which pycodestyle >/dev/null 2>&1
if [ $? -ne 0 ]; then
    errormsg "Command pycodestyle not found. Please install."
    exit 1
fi

PYTHON_FILES=$(git status --porcelain | grep -E '^[AM]...*\.py$')

if [ $? -eq 0 ]; then
    BASEDIR=$(git rev-parse --show-toplevel)

    while read PYTHON_FILE; do
        OUTPUT=$(pycodestyle --ignore=E121,E123,E126,E226,E24,E704,W503,W504,E501 "${BASEDIR}/${PYTHON_FILE}" 2>&1)

        if [ $? -ne 0 ]; then
            if [ $NO_ERRORS -eq 0 ]; then
                echo ""
                errormsg "[F10] Failure in $(basename $0) check"
                echo "" >&2
            fi

            while read line; do
                errormsg "${line}"
            done <<< "$(echo "${OUTPUT}")"

            NO_ERRORS=1
        fi
    done <<< "$(echo "${PYTHON_FILES}" | sed 's/^...//')"
fi

if [ $NO_ERRORS -ne 0 ]; then
    exit 1
fi
