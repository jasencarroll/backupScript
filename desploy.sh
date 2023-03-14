#!/bin/bash
# desploy - it's like a desktop deploy - sometimes you go with your typos.
sudo apt update && sudo apt upgrade
sudo apt install git gh ubuntu-server ssh virtualbox vagrant ansible libpam-pwquality pwgen whois
## For Docker
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
## Can now run Docker Desktop
## Will also need to generate key. 
## Commented out because I don't want to interact. 
# gpg --generate-key
## then you would:
# pass init <generated gpg-id public key>
## and open Docker and it should let you log in now. 

## provisioning minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --driver=virtualbox