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
echo "# kubectl apply -f ./manifests/3-app-bar.yml"
echo "=========================================================================="

kubectl apply -f ./manifests/3-app-bar.yml


echo
echo
echo "=========================================================================="
echo "# kubectl apply -f ./manifests/4-app-demo.yml"
echo "=========================================================================="

kubectl apply -f ./manifests/4-app-demo.yml


echo
echo
echo "=========================================================================="
echo "# kubectl apply -f ./manifests/5-ingress-apps.yml"
echo "=========================================================================="

kubectl apply -f ./manifests/5-ingress-apps.yml
