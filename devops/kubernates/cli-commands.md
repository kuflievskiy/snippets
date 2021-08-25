##
## Kubernetes Tutorial for Beginners [FULL COURSE in 4 Hours]
##
#
# https://www.youtube.com/watch?v=X48VuDVv0do
#


# 0:00 - Course Overview
# 2:18 - What is K8s
# 5:20 - Main K8s Components
# 22:29 - K8s Architecture
# 34:47 - Minikube and kubectl - Local Setup
# 44:52 - Main Kubectl Commands - K8s CLI
# 1:02:03 - K8s YAML Configuration File


- Install Minikube (Mac, Linux and Windows): https://minikube.sigs.k8s.io/docs/start/

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
# Install Kubectl
# https://kubernetes.io/docs/tasks/tools/


# https://gitlab.com/nanuchi/youtube-tutorial-series/-/blob/master/basic-kubectl-commands/cli-commands.md

```

######### create minikube cluster

```
# minikube start --vm-driver=hyperkit
minikube start --vm-driver=docker
minikube stop
kubectl get nodes
minikube status
kubectl version
```

####### delete cluster and restart in debug mode
```
minikube delete
#minikube start --vm-driver=hyperkit --v=7 --alsologtostderr
minikube start --vm-driver=docker --v=7 --alsologtostderr
minikube status
```

####### kubectl commands
```
kubectl get nodes
kubectl get pod
kubectl get services
kubectl create deployment nginx-depl --image=nginx
kubectl get deployment
kubectl get replicaset
kubectl edit deployment nginx-depl
```

####### debugging
```
kubectl logs {pod-name}
kubectl exec -it {pod-name} -- bin/bash
```

####### create mongo deployment
```
kubectl create deployment mongo-depl --image=mongo
kubectl logs mongo-depl-{pod-name}
kubectl describe pod mongo-depl-{pod-name}
```

####### delete deplyoment
```
kubectl delete deployment mongo-depl
kubectl delete deployment nginx-depl
```


####### create or edit config file
```
vim nginx-deployment.yaml
kubectl apply -f nginx-deployment.yaml
kubectl get pod
kubectl get deployment
```

####### delete with config
```
kubectl delete -f nginx-deployment.yaml
#Metrics
kubectl top The kubectl top command returns current CPU and memory usage for a cluster’s pods or nodes, or for a particular pod or node if specified.
```


####### ####### ####### ####### ####### ####### ####### ####### 
####### 
####### ####### ####### ####### ####### ####### ####### ####### 

```


- Gitlab: If you are using Mac, you can follow along the commands.
# https://gitlab.com/nanuchi/youtube-tutorial-series/-/blob/master/basic-kubectl-commands/cli-commands.md



# 1:16:16 - Demo Project: MongoDB and MongoExpress
# 1:46:16 - Organizing your components with K8s Namespaces
# 2:01:52 - K8s Ingress explained
# 2:24:17 - Helm - Package Manager
# 2:38:07 - Persisting Data in K8s with Volumes
# 2:58:38 - Deploying Stateful Apps with StatefulSet
# 3:13:43 - K8s Services explained


########################################################################################################################
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/


#Install kubectl binary with curl on Linux

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256) kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client



####
#### https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
####

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

https://kubernetes.io/docs/tasks/tools/
https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/