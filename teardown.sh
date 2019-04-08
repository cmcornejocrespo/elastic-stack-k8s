#!/usr/bin/env bash

az aks get-credentials --resource-group elastic-aks --name elastic-aks --overwrite-existing

kubectl delete -Rf k8s-specs/
sleep 30
kubectl delete pvc elasticsearch-data-elasticsearch-0 -n elastic
kubectl delete namespace elastic