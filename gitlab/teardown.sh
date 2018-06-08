#!/bin/bash

if ! which kubectl; then
  echo "kubectl command not installed"
  exit 1
fi

# delete the ingress
for ing in *-ing.yml
do
  echo -n "Deleting $ing... "
  kubectl -f $ing delete
done


# delete the services
for svc in *-svc.yml
do
  echo -n "Deleting $svc... "
  kubectl -f $svc delete
done

# delete the deployments
for dep in *-deployment.yml
do
  echo -n "Deleting $dep... "
  kubectl -f $dep delete
done
