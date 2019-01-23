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

## Deploy all services (creates namespace)
``` bash
./bootstrap.sh
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

## Watch pets events
``` bash
kubectl
```

## Watch cluster events
``` bash
kubectl get pods --all-namespaces -w
```

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