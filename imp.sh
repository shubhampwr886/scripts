#!/bin/bash

apt update
apt -y install vim git  htop 

installdocker(){
	#Removing old packages
	apt-get remove docker docker-engine docker.io containerd runc

	#Installing Dependancies
	apt-get -y update
	apt-get -y install \
    		apt-transport-https \
    		ca-certificates \
    		curl \
    		gnupg-agent \
    		software-properties-common

	#Docker Repo Addition
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	apt-key fingerprint 0EBFCD88
	add-apt-repository \
   		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   		$(lsb_release -cs) \
   		stable"

	apt-get -y update
	apt-get -y install docker-ce docker-ce-cli containerd.io

	#Docker Test
	docker run hello-world

}

insatlldockercompose(){
	#Docker Compose
	curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
}

installk8s(){
	curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
	apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
	apt -y install kubeadm
	kubeadm version
	swapoff -a
}

removek8s(){
	kubeadm reset
	rm -rf ~/.kube
}

startk8s(){
	kubeadm init --pod-network-cidr=10.244.0.0/16
	mkdir -p $HOME/.kube
	cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
	chown $(id -u):$(id -g) $HOME/.kube/config
}

installjdk(){
	apt -y install openjdk-8-jdk
}

insatllvirtualbox(){
	apt update
	apt install virtualbox virtualbox-ext-pack
}

installminikube(){
	apt-get update
	apt-get install apt-transport-https
	apt-get upgrade
	insatllvirtualbox
	wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	chmod +x minikube-linux-amd64
	mv minikube-linux-amd64 /usr/local/bin/minikube
	curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

}

installnfs(){
	dnf install nfs-utils
	systemctl start nfs-server.service
	systemctl enable nfs-server.service
	systemctl status nfs-server.service
	mkdir  -p /nfspv
	chown nobody: /nfspv
	echo "/nfspv *(rw,sync,no_all_squash,root_squash)" >> /etc/exports
	exportfs -arv
	exportfs  -s
	firewall-cmd --permanent --add-service=nfs
	firewall-cmd --permanent --add-service=rpc-bind
	firewall-cmd --permanent --add-service=mountd
	firewall-cmd --reload
}

installjenkins(){
	wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
	sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
	apt-get update
	apt-get install jenkins

}

#installdocker
#insatlldockercompose
#insatllvirtualbox
#installminicom
#removek8s
#installk8s
#startk8s
#installjdk
#installjenkins



