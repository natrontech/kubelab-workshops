#!/bin/bash

check_permission=`kubectl auth can-i get pods -n team-a --as=system:serviceaccount:team-a:pod-reader`

if [ "$check_permission" = "yes" ]; then
  echo "Success! You can get pods"
  exit 0
else
  echo "Error! You can't get pods"
  exit 1
fi