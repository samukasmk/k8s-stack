#!/bin/bash
#

set -euo pipefail

echo ">> Namespace"
kubectl apply -f ./manifests/1-namespace.yml

echo ">> Secret htpasswd"
kubectl apply -f ./manifests/2-secret-htpasswd.yml

echo ">> PVC"
kubectl apply -f ./manifests/3-pvc.yml

echo ">> Deployment"
kubectl apply -f ./manifests/4-deployment.yml

echo ">> Service"
kubectl apply -f ./manifests/5-service.yml

echo ">> Ingress"
kubectl apply -f ./manifests/6-ingress.yml

echo ">> Aguardando ficar pronto..."
kubectl -n tools rollout status deploy/docker-registry
kubectl -n tools get all,ingress
