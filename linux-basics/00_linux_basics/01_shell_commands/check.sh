#!/bin/bash

# Script to check if the user completed the tasks correctly

cd ~/exercise/linux-basics

# Check each task
if [ -f hello.txt ] && [ -f hello_copy.txt ] && [ -f test_moved.txt ] && [ ! -f test.txt ] && [ ! -f empty.txt ]; then
    echo "All tasks completed successfully!"
else
    echo "Some tasks are not completed correctly. Please review the exercise instructions and try again."
    exit 1
fi
