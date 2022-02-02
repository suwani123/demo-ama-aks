#!/bin/bash

# Requires Ubuntu host 18.04 DS2_V2 using hostname and user amaaks

# Install Docker https://docs.docker.com/engine/install/ubuntu/
sudo apt-get updates
sudo apt-get upgrade -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker amaaks

# Install Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install KubeCtl
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Install Az
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Copy the deployment files for the AKS configuration
wget https://raw.githubusercontent.com/code4clouds/amaaks/main/aks-harbor-ca-daemonset.yaml 
wget https://raw.githubusercontent.com/code4clouds/amaaks/main/kanary-deployment.yaml 
wget https://raw.githubusercontent.com/code4clouds/amaaks/main/kanary-service.yaml 
wget https://raw.githubusercontent.com/code4clouds/amaaks/main/aks-setup.sh
sudo chmod +x aks-setup.sh
./aks-setup.sh $1

exit;

# Testing the registry by upload a container to amaaks
#sudo docker login amaaks:443 -u admin
#sudo docker tag code4clouds/canarykontainer:1.1 amaaks:443/library/canarykontainer:1.1
#sudo docker push amaaks:443/library/canarykontainer:1.1
#Setup replication for dockerhub (check the pictures on how to do this)
#sudo docker pull amaaks:443/code4clouds/canarykontainer:1.2
