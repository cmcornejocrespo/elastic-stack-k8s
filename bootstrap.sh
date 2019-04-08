#!/usr/bin/env bash

az aks get-credentials --resource-group elastic-aks --name elastic-aks --overwrite-existing
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin  --serviceaccount=kube-system:kubernetes-dashboard

kubectl create namespace elastic
kubectl create -Rf k8s-specs/