kubectl create namespace kafka
kubectl apply -n kafka -f https://strimzi.io/install/latest?namespace=kafka

kubectl -n kafka get pods

kubectl apply -f kafka-cluster.yaml