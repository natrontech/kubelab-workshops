#!/bin/bash

# Script to check if the user completed the task correctly

cd ~/yaml-basics

# Check the content of the file
if grep -q "is_student: true" sample.yaml && grep -q "coding" sample.yaml && grep -q "zip: '67890'" sample.yaml; then
    echo "Task completed successfully!"
else
    echo "The task is not completed correctly. Please review the exercise instructions and try again."
    exit 1
fi
