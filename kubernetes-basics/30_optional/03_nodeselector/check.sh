#!/bin/bash

selector=`kubectl get deploy -n team-b webservice -o jsonpath='{.spec.template.spec.nodeSelector.kubernetes\.io/os}'`

# check if selector is linux
if [ $selector == "linux" ]; then
  echo "Success! NodeSelector is linux"
  exit 0
else
  echo "Error! NodeSelector is not linux"
  exit 1
fi