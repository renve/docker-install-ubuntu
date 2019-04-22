#!/bin/bash

echo "installing docker dependencies"
sudo apt-get install \
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
sudo apt-get update

echo "installing docker"
sudo apt-get install docker-ce docker-ce-cli containerd.io


