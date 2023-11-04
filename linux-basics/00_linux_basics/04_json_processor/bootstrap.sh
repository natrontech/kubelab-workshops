#!/bin/bash

# Set up the environment for the jq basics exercise
cd ~
rm -rf jq-basics
mkdir jq-basics
cd jq-basics
echo '{
  "name": "John Doe",
  "age": 30,
  "is_student": false,
  "hobbies": ["reading", "jogging", "coding"],
  "address": {
    "street": "123 Main St",
    "city": "Anytown",
    "zip": "12345"
  }
}' > sample.json
