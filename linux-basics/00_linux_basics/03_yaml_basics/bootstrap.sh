#!/bin/bash

# Set up the environment for the YAML basics exercise
cd ~
rm -rf yaml-basics
mkdir yaml-basics
cd yaml-basics
echo "name: John Doe
age: 30
is_student: false
hobbies:
  - reading
  - jogging
  - coding
address:
  street: 123 Main St
  city: Anytown
  zip: '12345'" > sample.yaml
