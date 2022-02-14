# demo-ama-aks
Demo application to setup aks in azure marketplace

# Description 
Proof of concept to show how manage application offer support to provision containers and Azure Kubernetes Service (AKS) resources
- Solution templates: 
The Solution Template offers are not changeable by the publisher after customer deployment. Therefore, containers and Azure Kubernetes Service (AKS) resources are not currently allowed in this offer category.
- Managed applications: 
The Managed Application offers allow the publisher to access and control the resources created during deployment in the customer’s subscription. Therefore, containers and Azure Kubernetes Service (AKS) resources are provisionally allowed in this offer category.

# Manage Applications can have different approach 
- Via VM offer by executing custom scripts 
- Via deployment scripts 
- Via helm charts 

# Prerequisites  
1. ARM template preperation [(Refer the attached sample file)](https://raw.githubusercontent.com/suwani123/demo-ama-aks/main/mainTemplate.json)
2. UI Defenition [(Refer the attached sample file)](https://raw.githubusercontent.com/suwani123/demo-ama-aks/main/createUiDefinition.json)
3. Custom script which run inside the vm offer [(Refer the attached sample file)](https://raw.githubusercontent.com/suwani123/demo-ama-aks/main/vmoffer-setup.sh)

# Setup the test the manage application via azure portal
- Create Azure package into a .zip file [(refer the sample zip file)](https://raw.githubusercontent.com/suwani123/demo-ama-aks/main/ama-aks.zip)
- Upload it into a storage account 
- create the Service Catalog Managed Application Definition
- Service Catalog Managed Application 
- Run the application

# Reference 
- [Azure manage application overview](https://docs.microsoft.com/en-us/azure/marketplace/plan-azure-app-managed-app)
- [Sample Azure Managed Application with AKS](https://github.com/arsenvlad/azure-managed-app-aks-managed-identity/tree/master/ama-aks)
- [Video Learning Modules from Hands-on Workshop](https://github.com/microsoft/Mastering-the-Marketplace/tree/main/ama)
