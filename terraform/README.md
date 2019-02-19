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

# init (requires export ACCOUNT_KEY)
terraform init -var "client_id=your_client_id" -var "client_secret=your_client_secret"

# plan
terraform plan -var "client_id=your_client_id" -var "client_secret=your_client_secret"

# apply (this will create the cluster!!)
terraform apply -var "client_id=your_client_id" -var "client_secret=your_client_secret"
```
## Setup storageclass to store terraform state
``` bash

RESOURCE_GROUP_NAME=tstate-aks-pets
STORAGE_ACCOUNT_NAME=tstateakspets$RANDOM
CONTAINER_NAME=tstate-aks-pets
LOCATION=ukwest

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"

# Configure state backend

# Create a Key Vault
az keyvault create --name "myAKVault" --resource-group "$RESOURCE_GROUP_NAME" --location "$LOCATION"

# Add a secret to Key Vault
az keyvault secret set --vault-name "myAKVault" --name "terraform-backend-key" --value "$ACCOUNT_KEY"

#export ak to be used within tf init
export ARM_ACCESS_KEY=$(az keyvault secret show --name terraform-backend-key --vault-name myAKVault --query value -o tsv)
``` 

# Setup Kubernetes dashboard
``` bash
az aks get-credentials --resource-group aks-pets --name aks-pets --overwrite-existing

# rbac users
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin  --serviceaccount=kube-system:kubernetes-dashboard

``` 
# Connect

``` bash
# get creds
az aks get-credentials --resource-group aks-pets --name aks-pets --overwrite-existing

# open dashboard
az aks browse --resource-group aks-pets --name aks-pets
```