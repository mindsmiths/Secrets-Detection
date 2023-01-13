#!/bin/bash

echo "Please enter your work directory (full path). Or some other path that will be used to recursively update local git repos with pre-commit:"
while : ; do
    read SCAN_DIR <&1
    if [[ ! -z ${SCAN_DIR} ]]; then
        break;
    fi
done
echo $SCAN_DIR

if [[ ! -d ${SCAN_DIR} ]]; then
    echo "Directory does not exists!"
    exit 1
fi

PATHS=$(find ${SCAN_DIR} -name .git -type d)
for path in $PATHS; do 
    echo $path
done

echo "Above are git directories that will be setup with pre-commit hook. Are you sure you want to continue? [y/N]"
while : ; do
    read ANSWER <&1
     if [[ "${ANSWER}" -eq "y" ]]; then
        for path in $PATHS; do 
            echo Adding precommit to:  $path
            cp pre-commit "${path}/hooks/pre-commit"
        done
        echo "Done setting up gitleaks locally."
        break
    else
        echo "Exiting!"
        exit 0
     fi
done