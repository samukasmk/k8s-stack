#!/bin/bash
#

# echo
# echo
# echo "=========================================================================="
# echo "# kubectl apply -f ./manifests/1-namespace.yml"
# echo "=========================================================================="
#
# kubectl apply -f ./manifests/1-namespace.yml


echo
echo
echo "=========================================================================="
echo "# kubectl apply -f ./manifests/2-app-foo.yml"
echo "=========================================================================="
kubectl apply -f ./manifests/2-app-foo.yml

echo
echo
echo "=========================================================================="
echo "# kubectl rollout status pod/foo-app --timeout=5m"
echo "=========================================================================="
kubectl rollout status pod/foo-app --timeout=5m


echo
echo
echo "=========================================================================="
echo "# kubectl apply -f ./manifests/3-app-bar.yml"
echo "=========================================================================="

kubectl apply -f ./manifests/3-app-bar.yml

echo
echo
echo "=========================================================================="
echo "# kubectl rollout status replicaset/bar-app --timeout=5m"
echo "=========================================================================="
kubectl rollout status replicaset/bar-app --timeout=5m

echo
echo
echo "=========================================================================="
echo "# kubectl apply -f ./manifests/4-app-demo.yml"
echo "=========================================================================="

kubectl apply -f ./manifests/4-app-demo.yml

echo
echo
echo "=========================================================================="
echo "# kubectl rollout status deployment/web --timeout=5m"
echo "=========================================================================="
kubectl rollout status deployment/web --timeout=5m

echo
echo
echo "=========================================================================="
echo "# kubectl apply -f ./manifests/5-ingress-apps.yml"
echo "=========================================================================="

kubectl apply -f ./manifests/5-ingress-apps.yml
