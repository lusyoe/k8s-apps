#!/bin/bash

if ! which kubectl; then
  echo "kubectl command not installed"
  exit 1
fi

# create the pvc
for pvc in *-pvc.yml
do
  echo -n "Creating $pvc... "
  kubectl -f $pvc create
done


# create the services
for svc in *-svc.yml
do
  echo -n "Creating $svc... "
  kubectl -f $svc create
done

# create the deployments
for dep in *-deployment.yml
do
  echo -n "Creating $dep... "
  kubectl -f $dep create
done

# list pod,rc,svc
echo "Pod:"
kubectl get pod

echo "Deployment:"
kubectl get deployment

echo "Service:"
kubectl get svc

echo "Ingress:"
kubectl get ingress
