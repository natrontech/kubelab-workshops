#!/bin/bash

# Script to check if the user completed the task correctly

cd ~/grep-basics

# Check if the user has found the correct number of lines with the word 'Hello'
if [ $(grep -c 'Hello' sample.txt) -eq 2 ]; then
    echo "Task completed successfully!"
else
    echo "The task is not completed correctly. Please review the exercise instructions and try again."
fi
