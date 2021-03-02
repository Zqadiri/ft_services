## Ressources :



# Notion :

https://www.notion.so/ft_services-f032ecf159dc4994a3bd4c5160a0cf7a

# ft_services :
[Some additional definitions](https://www.notion.so/Some-additional-definitions-94dfc7eae87f456eaa97692a6e008903)

#Introduction :
## what is Docker?

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

# Check Kubernetes storage status
kubectl get pv         # persistent volume
kubectl get pvc        # persistent volume claim

# Create a pod from a YAML file
kubectl create -f <file.yaml>

# Delete a pod
kubectl delete deployment <your deployment>
kubectl delete service <your service>

# Remove a pod using the name and type listed in YAML FILE:
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

What is a reverse proxy?

A reverse proxy is a server that sits in front of web servers and forwards client (e.g. web browser) requests to those web servers. Reverse proxies are typically implemented to help increase security, performance, and reliability. In order to better understand how a reverse proxy works and the benefits it can provide, let’s first define what a proxy server is.

![https://www.cloudflare.com/img/learning/cdn/glossary/reverse-proxy/reverse-proxy-flow.svg](https://www.cloudflare.com/img/learning/cdn/glossary/reverse-proxy/reverse-proxy-flow.svg)

What’s a proxy server?

A forward proxy, often called a proxy, proxy server, or web proxy, is a server that sits in front of a group of client machines. When those computers make requests to sites and services on the Internet, the proxy server intercepts those requests and then communicates with web servers on behalf of those clients, like a middleman.

![https://www.cloudflare.com/img/learning/cdn/glossary/reverse-proxy/forward-proxy-flow.svg](https://www.cloudflare.com/img/learning/cdn/glossary/reverse-proxy/forward-proxy-flow.svg)

Allow access to /phpmyadmin with a reverse proxy :

[Setting up an Nginx Reverse Proxy](https://linuxize.com/post/nginx-reverse-proxy/)

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

 From inside your Kubernetes network (from container to another container), you can access the service by its name, and not its IP. For example, you have a service "MySQL" linked to a MySQL container. To access this container from an Nginx container, you can try:

```bash
mysql <database> -u <user> -p -h mysql
# Normally, we access with IP like that:
mysql <database> -u <user> -p -h <ip address>
```

### Persistent Volume and Persistent Volume Claim:

Kubernetes separates the basic unit of storage into two concepts. PV is a piece of storage which supposed to be pre-allocated by an admin. And PVC is a request for a piece of storage by a user.

It said that Kubernetes expects the admin to allocate various sized PVs beforehand. When the user creates PVC to request a piece of storage, Kubernetes will try to match that PVC with a pre-allocated PV. If a match can be found, the PVC will be bound to the PV, and the user will start to use that pre-allocated piece of storage.

- Create a PersistentVolumeClaim :

[Configure a Pod to Use a PersistentVolume for Storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolumeclaim)

- Example: Deploying WordPress and MySQL with Persistent Volumes :

[Example: Deploying WordPress and MySQL with Persistent Volumes](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/#deploy-wordpress)

[Kubernetes storage basics: PV, PVC and StorageClass](https://blog.mayadata.io/kubernetes-storage-basics-pv-pvc-and-storageclass)

## WordPress :

we need to create a WordPress website listening on port 5050, which will work with a MySQL database. WordPress needs its own Nginx server.

- Installation :

[WordPress](https://wiki.alpinelinux.org/wiki/WordPress)

- Editing  wp-config.php :

[Editing wp-config.php](https://wordpress.org/support/article/editing-wp-config-php/)

- Add FastCGI Proxying within Nginx is for PHP processing :

[Understanding and Implementing FastCGI Proxying in Nginx | DigitalOcean](https://www.digitalocean.com/community/tutorials/understanding-and-implementing-fastcgi-proxying-in-nginx)

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

- Install influxDB:

```bash
apk add influxdb --no-cache
```

- Add Telegraf :

It is an agent for collecting, processing, aggregating, and writing metrics. It also has output plugins to send metrics to a variety of other datastores, services, and message queues, including InfluxDB.

```bash
apk add telegraf --no-cache --repository [http://dl-2.alpinelinux.org/alpine/edge/community](http://dl-2.alpinelinux.org/alpine/edge/community)
```

- Configuring Telegraf :

[Configuring Telegraf](https://docs.influxdata.com/telegraf/v1.17/administration/configuration/)

## Grafana :

Grafana is multi-platform open-source analytics and interactive visualization web application. It provides charts, graphs, and alerts for the web when connected to supported data sources.

It helps us track the user behavior, application behavior, frequency of errors popping up in production or a pre-prod environment, type of errors popping up & the contextual scenarios by providing relative data.

We'll send all container data (CPU usage, memory, processes) easily by using Telegraf. It's a simple program that sends system data to an InfluxDB instance.

So our stack is: Telegraf --> InfluxDB --> Grafana Get data Store data Visualize Data

So there are two connections to configure, Telegraf to InfluxDB which is done in the /etc/telegraf/telegraf.conf file, and the Grafana to InfluxDB which is done from the Grafana web interface.

You can test an InfluxDB connection by fetching /ping endpoint:

```bash
curl [http://influxdb:8086/ping](http://influxdb:8086/ping)
```

- Install Grafana :

[Download Grafana](https://grafana.com/grafana/download?edition=enterprise&platform=docker)

Package details:

- Installs binary to `/usr/sbin/grafana-server`
- Installs Init.d script to `/etc/init.d/grafana-server`
- Creates default file (environment vars) to `/etc/default/grafana-server`
- Installs configuration file to `/etc/grafana/grafana.ini`
- Installs systemd service (if systemd is available) name `grafana-server.service`
- The default configuration sets the log file at `/var/log/grafana/grafana.log`
- The default configuration specifies a SQLite3 db at `/var/lib/grafana/grafana.db`
- Installs HTML/JS/CSS and other Grafana files at `/usr/share/grafana`
- Execute the binary :

The grafana-server binary `.tar.gz` needs the working directory to be the root install directory where the binary and the public folder are located.

Start Grafana by running:

```bash
./bin/grafana-server web
```

- Add the templated dashboard for Telegraf : (928 , 914)

[Telegraf: system dashboard dashboard for Grafana](https://grafana.com/grafana/dashboards/928)

[Telegraf system overview dashboard for Grafana](https://grafana.com/grafana/dashboards/914)

- Some good ressources :

[How to Deploy InfluxDB / Telegraf / Grafana on K8s?](https://octoperf.com/blog/2019/09/19/kraken-kubernetes-influxdb-grafana-telegraf/#prerequisites)

Dashboard overview :

[Dashboards](https://grafana.com/docs/grafana/latest/dashboards/?pg=docs)

[InfluxDB](https://grafana.com/docs/grafana/latest/datasources/influxdb/)

## FTPs :

### What is FTP?

FTP is also referred to as File Transfer Protocol.

FTP is a standard network protocol used to transfer files from one computer to another over the Internet. FTP users authenticate themselves using a sign-in protocol, normally in the form of a username and password.

Installation :

[FTP](https://wiki.alpinelinux.org/wiki/FTP)

[vsftpd.conf(5) - Linux man page](https://linux.die.net/man/5/vsftpd.conf)

- Configure vsftpd to use SSL:

[How To Configure vsftpd to Use SSL/TLS on an Ubuntu VPS | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-configure-vsftpd-to-use-ssl-tls-on-an-ubuntu-vps)

## Liveness probe:

Liveness probes let Kubernetes know if your app is alive or dead. If your app is alive, then Kubernetes leaves it alone. If your app is dead, Kubernetes removes the Pod and starts a new one to replace it.

### What is the difference between liveness and readiness probe?

Both liveness & readiness probes are used to control the health of an application. Failing liveness probe will restart the container, whereas failing readiness probe will stop our application from serving traffic.

### Type of Probes :

There are three types of probes: HTTP, Command, and TCP. You can use any of them for liveness and readiness checks.

**`HTTP`**

HTTP probes are probably the most common type of custom liveness probe. Even if your app isn’t an HTTP server, you can create a lightweight HTTP server inside your app to respond to the liveness probe. Kubernetes pings a path, and if it gets an HTTP response in the 200 or 300 range, it marks the app as healthy. Otherwise, it is marked as unhealthy.

**`Command`**

For command probes, Kubernetes runs a command inside your container. If the command returns with exit code 0, then the container is marked as healthy. Otherwise, it is marked unhealthy.

**`TCP`**

The last type of probe is the TCP probe, where Kubernetes tries to establish a TCP connection on the specified port. If it can establish a connection, the container is considered healthy; if it can’t it is considered unhealthy.

[How to define a liveness command](https://stackoverflow.com/questions/45647825/how-to-define-a-liveness-command)