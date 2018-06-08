#!/bin/bash

if ! which kubectl; then
  echo "kubectl command not installed"
  exit 1
fi

# delete the pvc
kubectl delete -f nexus2-pvc.yml -f nexus2.yml
