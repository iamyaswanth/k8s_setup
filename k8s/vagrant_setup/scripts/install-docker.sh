#!/bin/bash
sudo su
echo "[INFO]updating repo"
apt-get update
echo "[INFO]Installing docker"
apt-get install -y docker.io
echo "[INFO]Docker installed"
echo "[INFO]Enabling docker service"
systemctl enable docker >/dev/null 2>&1
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
echo "[INFO]Installing kubelet kubeadm kubectl"
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
