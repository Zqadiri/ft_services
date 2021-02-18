
echo "delete mini...."
minikube delete
echo "start mini...."
# minikube start --driver=virtualbox
minikube --memory 8192 --cpus 4 start
eval $(minikube docker-env)

echo "add metallb ...."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb.yaml

# docker build -t nginx_service  srcs/nginx
# docker build -t mysql_service  srcs/mysql
# docker build -t wordpress_service  srcs/wordpress
# docker build -t phpmyadmin_service  srcs/phpmyadmin
docker build -t influxdb_service  srcs/influxdb
docker build -t grafana_service  srcs/grafana

# kubectl apply -f nginx.yaml
# kubectl apply -f mysql.yaml
# kubectl apply -f wordpress.yaml
# kubectl apply -f phpmyadmin.yaml
kubectl apply -f influxdb.yaml
kubectl apply -f grafana.yaml



minikube dashboard

# https://skylerlehan.dev/reconfigure-minikubes-cpus-and-memory/