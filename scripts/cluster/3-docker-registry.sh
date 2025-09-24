#!/bin/bash
#

set -euo pipefail

echo ">> Namespace"
kubectl apply -f manifests/tools/registry/1-namespace.yml

echo ">> Secret htpasswd"
kubectl apply -f manifests/tools/registry/2-secret-htpasswd.yml

echo ">> PVC"
kubectl apply -f manifests/tools/registry/3-pvc.yml

echo ">> Deployment"
kubectl apply -f manifests/tools/registry/4-deployment.yml

echo ">> Service"
kubectl apply -f manifests/tools/registry/5-service.yml

echo ">> Ingress"
kubectl apply -f manifests/tools/registry/6-ingress.yml

echo ">> Aguardando ficar pronto..."
kubectl -n tools rollout status deploy/docker-registry
kubectl -n tools get all,ingress
