#This should run ONLY on the worker nodes
echo "[INFO]Setting up Worker nodes"
apt-get  install -y sshpass >/dev/null 2>&1
sudo sshpass -p "rootvagrant" scp -o StrictHostKeyChecking=no master-1:/joincluster.sh /joincluster.sh
echo "[INFO]Adding workernode to the cluster"
bash /joincluster.sh >/dev/null 2>&1
echo "[INFO]Workernode added to the cluster successfully"