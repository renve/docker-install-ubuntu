#!/bin/bash

#remove docker if needed 
#sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update -y

echo "installing docker dependencies"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo "adding gpg key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "verifying fingerprint"
sudo apt-key fingerprint 0EBFCD88

echo "adding docker repo"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sleep 2

echo "updating"
sudo apt-get update -y
echo "installing docker"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#add user to docker group to avoid typing sudo docker
#sudo usermod -aG docker $USER 

#Install link for docker-machine
#https://docs.docker.com/machine/install-machine/
#base=https://github.com/docker/machine/releases/download/v0.16.0 &&
#  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
#  sudo install /tmp/docker-machine /usr/local/bin/docker-machine

#Install docker compose and add executable
#sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose

