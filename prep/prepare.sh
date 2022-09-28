TERRAFORM_RESOURCEGROUP_NAME="rg-expertslive-terraform"
BICEP_RESOURCEGROUP_NAME="rg-expertslive-bicep"
ACR_NAME="acrbicepvsterraform"
ACR_RESOURCEGROUP_NAME="rg-bicep-vs-terraform"

az account set -s Sponsorship

az group delete -n $TERRAFORM_RESOURCEGROUP_NAME --yes
az group delete -n $BICEP_RESOURCEGROUP_NAME --yes

az group delete -n $ACR_RESOURCEGROUP_NAME --yes
az group create -l westeurope -n $ACR_RESOURCEGROUP_NAME

az acr create -n $ACR_NAME -g $ACR_RESOURCEGROUP_NAME --sku Basic