# ft_services 🐳☸️

> **ft_services** is an infrastructure and DevOps project built around **Docker** and **Kubernetes**.  
The goal is to deploy, configure, and orchestrate multiple services inside a local Kubernetes cluster using **Minikube** and **MetalLB**.

📘 **Full documentation (Notion)**  
https://www.notion.so/ft_services-f032ecf159dc4994a3bd4c5160a0cf7a

---

## Table of Contents

- [Project Overview](#project-overview)
- [Tech Stack](#tech-stack)
- [Docker](#docker)
- [Kubernetes](#kubernetes)
- [Minikube](#minikube)
- [Core Services](#core-services)
  - Nginx
  - MetalLB
  - MySQL
  - WordPress
  - phpMyAdmin
  - InfluxDB & Telegraf
  - Grafana
  - FTPS
- [Storage (PV & PVC)](#storage-pv--pvc)
- [Health Checks](#health-checks)
- [Useful Commands](#useful-commands)
- [Resources](#resources)

---

## Project Overview

This project sets up a complete **containerized infrastructure** running on Kubernetes, including:

- Secure web access with HTTPS
- Reverse proxy routing
- Persistent data storage
- Monitoring and metrics visualization
- Secure file transfer
- Load balancing in a local environment

All services are deployed as Kubernetes resources and managed through `kubectl`.

---

## Tech Stack

- **Containerization:** Docker  
- **Orchestration:** Kubernetes  
- **Local Cluster:** Minikube  
- **Load Balancer:** MetalLB  
- **Web Server:** Nginx  
- **Database:** MySQL  
- **CMS:** WordPress  
- **DB Management:** phpMyAdmin  
- **Monitoring:** Telegraf, InfluxDB, Grafana  
- **File Transfer:** FTPS (vsftpd)

---

## Docker

Docker allows applications to be packaged with their dependencies into containers, ensuring consistency across environments.

### Basic Docker Commands

```bash
# List images
docker images

# Build an image
docker build -t <image_name> .

# Remove image
docker rmi <image_id>

# List containers
docker ps -a

# Run container
docker run -it <image_name>

# Copy files
docker cp <container_id>:<src_path> <dest_path>

# Remove stopped containers
docker rm $(docker ps -aq)

# Stop container
docker kill <container_id>

# Clean unused resources
docker system prune
