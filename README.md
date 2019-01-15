# Start Local Kubernetes
``` bash
minikube start
```

## Desplay active services
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
## Set up all services
In config folder start all deploy files: 
``` bash
kubectl create -Rf config/.
```

## Set down the cluster 
``` bash
kubectl create -Rf config/.
```

## Elasticsearch
Files to deploy elasticsearch are in config/elasticsearch folder. 
``` bash
ls config/elasticsearch/
elasticsearch-deployment.yaml  elasticsearch_service.yaml
```

## Kibana
### Config files
Files to deploy Kibana are located in config/kibana folder.
``` bash
ls config/kibana/
kibana-deployment.yaml  kibana-service.yaml
```

### Expose Kibana service 
``` bash
minikube service kibana
Opening kubernetes service default/kibana in default browser...
```
