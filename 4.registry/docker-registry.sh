#!/bin/bash
#

set -euo pipefail

echo ">> Namespace"
kubectl apply -f ./manifests/1-namespace.yml

echo ">> PVC"
kubectl apply -f ./manifests/2-pvc.yml

echo ">> Deployment"
kubectl apply -f ./manifests/3-deployment.yml

echo ">> Service"
kubectl apply -f ./manifests/4-service.yml

echo ">> Ingress"
kubectl apply -f ./manifests/5-ingress.yml

echo ">> Aguardando ficar pronto..."
kubectl -n tools rollout status deploy/docker-registry
kubectl -n tools get all,ingress
