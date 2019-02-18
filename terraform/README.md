# aks terraform provisioner

# Deploy cluster

``` bash
#prompt login
az login

# get accounts (get your subscriptionid)
az account list

# set account to use
az account set --subscription <subscriptionId>

# Show account details (get subscriptionId and tenantId)
az account show --query "{subscriptionId:id, tenantId:tenantId}"

# Create Role Contributor (appId==client_id, password==your_client_secret)
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<YOUR_SUBSCRIPTION_ID>"

# init
terraform init -var "client_id=your_client_id" -var "client_secret=your_client_secret"

# plan
terraform plan -var "client_id=your_client_id" -var "client_secret=your_client_secret"

# apply (this will create the cluster!!)
terraform apply -var "client_id=your_client_id" -var "client_secret=your_client_secret"
```

# Setup Kubernetes dashboard
``` bash
az aks get-credentials --resource-group aks-pets --name aks-pets

# rbac users
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin  --serviceaccount=kube-system:kubernetes-dashboard

``` 
# Connect

``` bash
# get creds
az aks get-credentials --resource-group aks-pets --name aks-pets

# open dashboard
az aks browse --resource-group aks-pets --name aks-pets
```