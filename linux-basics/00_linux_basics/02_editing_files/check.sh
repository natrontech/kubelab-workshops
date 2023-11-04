#!/bin/bash

# Script to check if the user completed the task correctly

cd ~/file-editing

# Check the content of the file
if grep -q "Successfully edited with nano" editme.txt || grep -q "Successfully edited with vim" editme.txt; then
    echo "Task completed successfully!"
else
    echo "The task is not completed correctly. Please review the exercise instructions and try again."
    exit 1
fi
