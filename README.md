## Ressources :

https://github.com/t0mm4rx/ft_services
http://nginx.org/en/docs/dirindex.html
https://docs.nginx.com/nginx/admin-guide/



## ft_services :



## what is Docker ?

> Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and deploy it as one package. By doing so, thanks to the container, the developer can rest assured that the application will run on any other Linux machine regardless of any customized settings that machine might have that could differ from the machine used for writing and testing the code

## what is kubernetes ?

> Kubernetes (also known as k8s or "kube") is an [open source](https://www.redhat.com/en/topics/open-source/what-is-open-source) container orchestration platform that automates many of the manual processes involved in deploying, managing, and scaling containerized applications. In other words, you can cluster together groups of hosts running Linux® containers, and Kubernetes helps you easily and efficiently manage those clusters.

### Learn to speak Kubernetes :

As is the case with most technologies, language specific to Kubernetes can act as a barrier to entry. Let's break down some of the more common terms to help you better understand Kubernetes.

- **Control plane:** The collection of processes that control Kubernetes nodes. This is where all task assignments originate.
- **Nodes:** These machines perform the requested tasks assigned by the control plane.
- **Pod:** A group of one or more containers deployed to a single node. All containers in a pod share an IP address, IPC, hostname, and other resources. Pods abstract network and storage from the underlying container. This lets you move containers around the cluster more easily.
- **Replication controller:**  This controls how many identical copies of a pod should be running somewhere on the cluster.
- **Service:** This decouples work definitions from the pods. Kubernetes service proxies automatically get service requests to the right pod—no matter where it moves in the cluster or even if it’s been replaced.
- **Kubelet:** This service runs on nodes, reads the container manifests, and ensures the defined containers are started and running.
- **kubectl:** The command line configuration tool for Kubernetes.
- **Deployments :** represent a set of multiple, identical Pods with no unique identities. A Deployment runs multiple replicas of your application and automatically replaces any instances that fail or become unresponsive. In this way, Deployments help ensure that one or more instances of your application are available to serve user requests. Deployments are managed by the Kubernetes Deployment controller.

## what is Minikube ?

> Minikube is a utility you can use to run Kubernetes (k8s) on your local machine. It creates a single node cluster contained in a virtual machine (VM). This cluster lets you demo Kubernetes operations without requiring the time and resource-consuming installation of full-blown K8s.

