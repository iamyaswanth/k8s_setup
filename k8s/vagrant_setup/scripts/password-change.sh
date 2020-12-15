# Enable ssh password authentication
echo "[INFO] Enable ssh password authentication"
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# Set Root password
echo "[INFO] Setting root password"
echo -e "rootvagrant\nrootvagrant" | passwd root