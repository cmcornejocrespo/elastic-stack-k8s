#!/usr/bin/env bash

az aks get-credentials --resource-group aks-pets --name aks-pets --overwrite-existing
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin  --serviceaccount=kube-system:kubernetes-dashboard

kubectl create namespace pets
kubectl create -Rf k8s-specs/