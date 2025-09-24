
echo '--------------------------------------------------------------------------'
echo ">> Namespace"
echo '--------------------------------------------------------------------------'

echo "kubectl apply -f manifests/k8s/1-namespace.yml"
kubectl apply -f manifests/k8s/1-namespace.yml


echo '--------------------------------------------------------------------------'
echo ">> Pod"
echo '--------------------------------------------------------------------------'

echo "kubectl apply -f manifests/k8s/2-app-foo.yml"
kubectl apply -f manifests/k8s/3-app-foo.yml

echo '--------------------------------------------------------------------------'
echo ">> ReplicaSet"
echo '--------------------------------------------------------------------------'

echo "kubectl apply -f manifests/k8s/3-app-bar.yml"
kubectl apply -f manifests/k8s/4-app-bar.yml

echo '--------------------------------------------------------------------------'
echo ">> Deployment"
echo '--------------------------------------------------------------------------'

echo "kubectl apply -f manifests/k8s/4-app-demo.yml"
kubectl apply -f manifests/k8s/2-app-demo.yml

echo '--------------------------------------------------------------------------'
echo ">> Ingress"
echo '--------------------------------------------------------------------------'

echo "kubectl apply -f manifests/k8s/5-ingress-apps.yml"
kubectl apply -f manifests/k8s/5-ingress-apps.yml

echo '--------------------------------------------------------------------------'
echo ">> Testing"
echo '--------------------------------------------------------------------------'

echo "# testing: app-demo"
echo "curl apps.127.0.0.1.nip.io/"
curl apps.127.0.0.1.nip.io/


echo "# testing: app-foo"
echo "curl apps.127.0.0.1.nip.io/foo"
curl apps.127.0.0.1.nip.io/foo

echo
echo "# testing: app-bar"
echo "curl apps.127.0.0.1.nip.io/bar"
curl apps.127.0.0.1.nip.io/bar

echo
