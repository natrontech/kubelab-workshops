#!/bin/bash

# Set up the environment for the file editing exercise
cd ~
rm -rf file-editing
mkdir file-editing
cd file-editing
echo "Welcome to the file editing exercise.\nReplace this line with: 'Successfully edited with [editor-name].' where [editor-name] is either nano or vim." > editme.txt
