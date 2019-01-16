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

## Metricbeats
Metricbeats collects periodically some stats from services and operating system. Deploy it in Kubernetes with the following files.

### kube-state-metrics dependency
As Metricbeat documentation said (https://www.elastic.co/guide/en/beats/metricbeat/current/running-on-kubernetes.html#_deploy) is necessary deploy kube-state-metrics to get some metrics of kubernetes system.

## kube-state-metrics
Deploy kube-state-metrics using official repo kubernetes folder: https://github.com/kubernetes/kube-state-metrics#usage

## Filebeat
Filebeat is installed as a agent in each pod. It collects log events which is sended to Elasticsearch. 
