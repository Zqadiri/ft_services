## Ressources :



# Notion :

https://www.notion.so/ft_services-f032ecf159dc4994a3bd4c5160a0cf7a

# ft_services :

## what is Docker ?

> Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and deploy it as one package. By doing so, thanks to the container, the developer can rest assured that the application will run on any other Linux machine regardless of any customized settings that machine might have that could differ from the machine used for writing and testing the code

## what is kubernetes ?

> Kubernetes (also known as k8s or "kube") is an open source container orchestration platform that automates many of the manual processes involved in deploying, managing, and scaling containerized applications. In other words, you can cluster together groups of hosts running Linux® containers, and Kubernetes helps you easily and efficiently manage those clusters.

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

## Basic docker commands :

```docker
# see all images 
docker images

# Build an image from a Dockerfile
docker build -t <image name> <Dockerfile dir>

# delete image 
dokcer rmi <image id>

# see all running containers 
docker ps -a

# Start an instance of a docker image
docker run -it <your image name> 

# Copy files/folders between a container and the local filesystem
docker cp  <container id>:<src_path>  <dest_path>

# remove al stopped containers 
docker rm $(docker ps -a -q)

# Stop a container
docker kill <container ID>

# Delete all unused Docker images and cache and free SO MUCH SPACE on your computer
docker system prune

# Start an instance of a docker image
docker run -it <image name>

# Stop a container
docker kill <container id>
```

## Basic kubectl commands :

```docker
# List deployments
kubectl get deployment

# List all pods 
kubectl get pods
kubectl get pods -o wide

# Create a pod from a YAML file
kubectl create -f <file.yaml>

# Delete a pod
kubectl delete deployment <your deployment>
kubectl delete service <your service>

# Remove a pod using the name and type listed in yaml FILE:
kubectl delete -f <yaml file>

# Remove all pods
kubectl delete pods --all

# Copy data to pod or to our computer
kubectl cp <pod name>:<file> <to>

 # MINIKUBE

# starts a local Kubernetes cluster 
minikube start

# Deletes a local Kubernetes cluster
minikube delete <flags>

# Retrieves the IP address of the specified node 
minikube ip <flags>

# Stops a running local Kubernetes cluster
minikube stop <flags>
```
## Nginx :

Nginx is a web server that can also be used as a reverse proxy, load balancer, mail proxy, and HTTP cache. we need to create an Nginx container listening on ports 80and 443 (HTTPS)  the HTTP port should redirect type 301 to HTTPS. 

This container will allow access to a /WordPress route that makes a redirect 307
to IP: WPPORT. It should also allow access to /PHPMyAdmin with a reverse proxy to IP: PMAPORT.

[NGINX Docs | Admin Guide](https://docs.nginx.com/nginx/admin-guide/)

- install nginx :

[Nginx](https://wiki.alpinelinux.org/wiki/Nginx)

- SSL cert :

[How To Create a Self-Signed SSL Certificate for Nginx on CentOS 7 | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-centos-7#step-2-create-the-ssl-certificate)

[Configuring HTTPS servers](http://nginx.org/en/docs/http/configuring_https_servers.html)

- redirect http tp https :

[Redirect HTTP to HTTPS in Nginx](https://linuxize.com/post/redirect-http-to-https-in-nginx/)

- reverse proxy:

[NGINX Docs | NGINX Reverse Proxy](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)

## MetalLB:

What is load balancing?

> Load balancing is defined as the methodical and efficient distribution of network or application traffic across multiple servers in a server farm. Each load balancer sits between client devices and backend servers, receiving and then distributing incoming requests to any available server capable of fulfilling them.

MetalLB hooks into your Kubernetes cluster, and provides a network load-balancer implementation. In short, it allows you to create Kubernetes services of type “LoadBalancer” in clusters that don’t run on a cloud provider, and thus cannot simply hook into paid products to provide load-balancers.

- configuration (.yaml):

Load Balancer will have a single ip . the following configuration gives MetalLB control over IPs from 192.168.1.150 to 192.168.1.150 (just one ip address):

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 192.168.1.240-192.168.1.240
```

- Installation By Manifest :

To install MetalLB, apply the manifest:

```bash
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

Once MetalLB is installed and configured, to expose a service externally, simply create it with spec.type set to LoadBalancer and MetalLB will do the rest.

- IP Address Sharing :

By default, Services do not share IP addresses. If you have a need to colocate services on a single IP, you can enable selective IP sharing by adding the [metallb.universe.tf/allow-shared-ip](http://metallb.universe.tf/allow-shared-ip) annotation to services.

```yaml
annotations:
    metallb.universe.tf/allow-shared-ip: shared
```

Ressources :

[MetalLB, bare metal load-balancer for Kubernetes](https://metallb.universe.tf/installation/)

[MetalLB, bare metal load-balancer for Kubernetes](https://metallb.universe.tf/configuration/)

[MetalLB, bare metal load-balancer for Kubernetes](https://metallb.universe.tf/usage/)
## Mysql:

Mysql is an open-source relational database management system . Mysql listening  on  port 3306

and it must be a ClusterIP.

- Installation and configuration :

[Mysql](https://wiki.alpinelinux.org/wiki/Mysql)

- Create a new user and grant permissions in Mysql :

[How To Create a New User and Grant Permissions in MySQL | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql)

Create database :

[Create a MySQL Database Using the Command Line](https://www.inmotionhosting.com/support/website/how-to-create-a-database-using-mysql-from-the-command-line/)

- Initialize MySQL Data Directory (optionał):

```bash
mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
```

mysql_install_db initializes the MariaDB data directory and creates the system tables that it contains if they do not exist.

`--user=user_name`  The login user name to use for running mysqld. Files and
           directories created by mysqld will be owned by this user. You
           must be root to use this option. By default, mysqld runs
           using your current login name and files and directories that
           it creates will be owned by you.

`--datadir=path` The path to the MariaDB data directory.

 `/dev/null` is a special file that acts as a black hole
Together they mean "throw away any error messages" .

From inside your Kubernetes network (from container to another container, you can access the service by its name, and not its IP. For example,you have a service "MySQL" linked to a MySQL container. To access thiscontainer from an Nginx container, you can try:

```bash
mysql <database> -u <user> -p -h mysql
# Normally, we access with IP like that:
mysql <database> -u <user> -p -h <ip address>
```

## WordPress :

we need to create a WordPress website listening on port 5050, which will work with a MySQL database. WordPress needs its own Nginx server.

- Installation :

[WordPress](https://wiki.alpinelinux.org/wiki/WordPress)

- Editing  wp-config.php :

[Editing wp-config.php](https://wordpress.org/support/article/editing-wp-config-php/)

## PhpMyAdmin :

phpMyAdmin is a free software tool written in PHP, intended to handle the administration of MySQL over the Web. The default HTTP port phpMyAdmin that listens to is 5000 unless you have configured a different port.

- Installation :

[PhpMyAdmin](https://wiki.alpinelinux.org/wiki/PhpMyAdmin)

- Configuration :

[Configuration - phpMyAdmin 5.2.0-dev documentation](https://docs.phpmyadmin.net/en/latest/config.html)

To connect PhpMyAdmin to Mysql server change  `$cfg['Servers'][$i]['host']`  to the hostname or the IP address (ClusterIP) of your server. For example : 

```php
/* Server parameters */
$cfg['Servers'][$i]['host'] = '10.101.88.129';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;
```

## InfluxDB :

### What are Time-Series Databases?

> Time Series Databases, as their name state, are database systems specifically designed to handle time-related data.

Systems like Mysql are based on the fact that you have tables. Those tables contain columns and rows each one of them defining an entry in your table. Time Series Databases work differently

Data are still stored in ‘collections’ but those collections share a common denominator : they are aggregated over time.

Essentially, it means that for every point that you are able to store, you have a timestamp associated with it.

 For a better understanding check this out : 

[The Definitive Guide To InfluxDB In 2019 - devconnected](https://devconnected.com/the-definitive-guide-to-influxdb-in-2019/)