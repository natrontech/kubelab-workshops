#!/bin/bash

# Set up the environment for the grep basics exercise
cd ~
rm -rf grep-basics
mkdir grep-basics
cd grep-basics
echo 'Hello World!
This is a sample text file.
It contains several lines of text.
There are some repeated words in this file.
Hello again!
grep is a powerful tool.
You can use grep to search for specific patterns.
Have fun learning grep!' > sample.txt
