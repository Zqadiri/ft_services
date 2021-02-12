

minikube delete
minikube start --driver=virtualbox
eval $(minikube docker-env)

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb.yaml



docker build -t nginx_service  srcs/nginx
kubectl apply -f nginx.yaml