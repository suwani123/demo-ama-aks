# demo-ama-aks
Demo application to setup aks in azure marketplace

# Description 
Proof of concept to show how manage application offer support to provision containers and Azure Kubernetes Service (AKS) resources
- Solution templates: 
The Solution Template offers are not changeable by the publisher after customer deployment. Therefore, containers and Azure Kubernetes Service (AKS) resources are not currently allowed in this offer category.
- Managed applications: 
The Managed Application offers allow the publisher to access and control the resources created during deployment in the customer’s subscription. Therefore, containers and Azure Kubernetes Service (AKS) resources are provisionally allowed in this offer category.

# Manage Applications can have different approach 
- Via VM by executing custom scripts 
- Via deployment scripts 
- Via helm charts 

# Setup the manage application via VM 
- Create Azure Ubuntu VM
- Download the setup script
wget https://raw.githubusercontent.com/code4clouds/amaaks/main/vmoffer-setup.sh
cat ./vmoffer-setup.sh | base64 -w 0 # to use for script for VM custom extension script (optional)
sudo chmod +x ./vmoffer-setup.sh
 ./vmofffer-setup.sh
- 
