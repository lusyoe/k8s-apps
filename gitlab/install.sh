#!/bin/bash

if ! which kubectl; then
  echo "kubectl command not installed"
  exit 1
fi

# apply the pvc
for pvc in *-pvc.yml
do
  echo -n "Creating $pvc... "
  kubectl -f $pvc apply
done


# apply the services
for svc in *-svc.yml
do
  echo -n "Creating $svc... "
  kubectl -f $svc apply
done

# apply the deployments
for dep in *-deployment.yml
do
  echo -n "Creating $dep... "
  kubectl -f $dep apply
done

# apply the deployments
for ing in *-ing.yml
do
  echo -n "Creating $ing... "
  kubectl -f $ing apply
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
