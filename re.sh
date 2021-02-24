#!/bin/bash
kubectl delete -f ./$1.yaml
eval $(minikube docker-env)
docker build -f srcs/$1/Dockerfile -t $1_service .
kubectl apply -f /$1.yaml