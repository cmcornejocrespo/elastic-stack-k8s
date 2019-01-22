# Start Local Kubernetes
``` bash
# mirroring aks k8s version
minikube start --kubernetes-version v1.11.5 --cpus 2 --memory 8192
```

## Display active services
``` bash
kubectl get services
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   22m
```

## Open dashboard 
``` bash
minikube dashboard
```

# Set up the cluster
## Deploy all services
``` bash
kubectl create -Rf config/.
```

## Delete all services 
``` bash
kubectl delete -Rf config/.
```

### Expose Kibana service via minikube 
``` bash
minikube service kibana
Opening kubernetes service default/kibana in default browser...
```

## Watch cluster events
``` bash
kubectl get pods --all-namespaces -w
```

## Metricbeats
Metricbeats collects periodically some stats from services and operating system. Deploy it in Kubernetes with the following files.

### kube-state-metrics dependency
As Metricbeat documentation said (https://www.elastic.co/guide/en/beats/metricbeat/current/running-on-kubernetes.html#_deploy) is necessary deploy kube-state-metrics to get some metrics of kubernetes system.

## kube-state-metrics
Deploy kube-state-metrics using official repo kubernetes folder: https://github.com/kubernetes/kube-state-metrics#usage

## Filebeat
Filebeat is installed as a agent in each pod. It collects log events which is sended to Elasticsearch. 

## APM Server
APM Server collects info from APM Agent which are installed on differents pods. This information is transformed by APM and saved in Elastic. 

## Tips
### kubectl - Cheat Sheet

- [cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

### kubectl-autocomplete

- minikube

``` bash
#BASH
source <(minikube completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(minikube completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
#ZSH
source <(minikube completion zsh)  # setup autocomplete in zsh into the current shell
echo "if [ $commands[minikube] ]; then source <(minikube completion zsh); fi" >> ~/.zshrc # add autocomplete permanently to your zsh shell
```

- kubectl

``` bash
#BASH
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
#ZSH
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
echo "if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi" >> ~/.zshrc # add autocomplete permanently to your zsh shell
```