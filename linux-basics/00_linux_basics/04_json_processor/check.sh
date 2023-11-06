#!/bin/bash

# Script to check if the user completed the task correctly

cd ~/exercise/jq-basics

# Check the content of the file
if jq -e '.hobbies[] | select(.=="dancing")' sample.json >/dev/null && jq -e '.address.zip=="67890"' sample.json >/dev/null; then
    echo "Task completed successfully!"
else
    echo "The task is not completed correctly. Please review the exercise instructions and try again."
    exit 1
fi
