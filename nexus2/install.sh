#!/bin/bash

if ! which kubectl; then
  echo "kubectl command not installed"
  exit 1
fi

# create the pvc
kubectl create -f nexus2-pvc.yml

# create nexus2
kubectl create -f nexus2.yml

# list pod,rc,svc
echo "Pod:"
kubectl get pod

echo "Deployment:"
kubectl get deployment

echo "Service:"
kubectl get svc

echo "Ingress:"
kubectl get ingress
