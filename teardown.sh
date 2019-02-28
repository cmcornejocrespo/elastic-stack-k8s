#!/usr/bin/env bash

az aks get-credentials --resource-group aks-pets --name aks-pets --overwrite-existing

kubectl delete -Rf k8s-specs/
sleep 30
kubectl delete pvc elasticsearch-data-elasticsearch-0 -n pets
kubectl delete namespace pets