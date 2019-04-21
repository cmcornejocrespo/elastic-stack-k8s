#!/usr/bin/env bash

az aks get-credentials --resource-group elastic-aks --name elastic-aks --overwrite-existing
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin  --serviceaccount=kube-system:kubernetes-dashboard

kubectl apply -Rf k8s/storageclass/
kubectl create namespace elastic
kubectl apply -Rf k8s/specs/