#setting up master node
echo "[INFO]Setting up master node"
kubeadm init --apiserver-advertise-address=192.168.5.11 --pod-network-cidr=192.168.0.0/16
echo "[INFO]Generating join token"
rm -f /join_cluster.sh
kubeadm token create --print-join-command >> /joincluster.sh
echo "[INFO]Join command created and stored in /join_cluster.sh"
chmod 777 /join_cluster.sh
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml
#HELM installation:
echo "[INFO]Installing helm pre-requisites"
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
echo "[INFO]Installing helm"
sudo apt-get install helm
helm_version=`helm version|awk -F "," '{print $1}'|awk -F "{" '{print $2}'|awk -F ":" '{print $2}'`
echo [INFO]Installed helm version is: $helm_version
helm repo add stable https://charts.helm.sh/stable
