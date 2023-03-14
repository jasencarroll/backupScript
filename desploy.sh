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

## fixing swap
#sudo swapoff -a
#sudo dd if=/dev/zero of=/swapfile bs=1M count=32768 status=progress
#sudo chmod 600 /swapfile
#sudo mkswap /swapfile
#sudo swapon /swapfile
#echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
### Renegade - UUID=0bada02d-ac4e-462b-8a4e-b1d1dafddad7


#free -h
## Update /etc/deafult/grub with the following
# blkid
## GRUB_CMDLINE_DEFAULT add resume=UUID..... after queit splash
## Add this to the bottom GRUB_RECORDFAIL_TIMEOUT=0

# sudo filefrag -v /swapfile
## GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=0bada02d-ac4e-462b-8a4e-b1d1dafddad7 resume_offset=96946176"
# sudo nano /etc/initramf-tools/conf.d/resume

## sudo gedit /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
## [Re-enable hibernate by default in upower]
## Identity=unix-user:*
## Action=org.freedesktop.upower.hibernate
## ResultActive=yes
##
## [Re-enable hibernate by default in logind]
## Identity=unix-user:*
## Action=org.freedesktop.login1.hibernate;org.freedesktop.login1.handle-hibernate-key;org.freedesktop.login1;org.freedesktop.login1.hibernate-multiple-sessions;org.freedesktop.login1.hibernate-ignore-inhibit
## ResultActive=yes
# sudo apt install chrome-gnome-shell
