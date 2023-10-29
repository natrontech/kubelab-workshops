#!/bin/bash

# Check if the main container logs output is correct
log_output=$(kubectl logs snow -n winter process-file)

if [[ "$log_output" == "Snowflakes are unique!" ]]; then
    echo "Main container logs are correct."
    exit 0
else
    echo "Main container logs are incorrect."
    exit 1
fi
