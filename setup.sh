
echo "delete mini...."
minikube delete
echo "start mini...."
# export MINI_IP = $(minikube ip)
# export MINIKUBE_HOME="/goinfre/zqadiri/ft_services"
# minikube start 
minikube --memory 3072 --cpus 4 start
eval $(minikube docker-env)

echo "add metallb ...."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb.yaml

minikube dashboard &

echo "FTPS .. "
docker build -t ftps_service  srcs/ftps
kubectl apply -f ftps.yaml

echo "NGINX .."
docker build -t nginx_service  srcs/nginx
kubectl apply -f nginx.yaml

echo "MYSQL .."
docker build -t mysql_service  srcs/mysql
kubectl apply -f mysql.yaml

echo "WORDPRESS .."
docker build -t wordpress_service  srcs/wordpress
kubectl apply -f wordpress.yaml

echo "PHPMYADMIN .."
docker build -t phpmyadmin_service  srcs/phpmyadmin
kubectl apply -f phpmyadmin.yaml

echo "INFLUXDB .."
docker build -t influxdb_service  srcs/influxdb
kubectl apply -f influxdb.yaml

echo "GRAFANA .."
docker build -t grafana_service  srcs/grafana
kubectl apply -f grafana.yaml




# https://skylerlehan.dev/reconfigure-minikubes-cpus-and-memory/
