# Create cluster
echo 'Create cluster'
sudo kubeadm init --control-plane-endpoint=<Master node IP>:6443 --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


# Install network add-on
echo -e '\nInstall network add-on'
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
kubectl get pods --all-namespaces
kubectl get nodes
