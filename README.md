`$ bash scripts/1-create-kind-cluster.sh`

```
# kind create cluster --config manifests/kind/cluster.yml
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.32.2) 🖼
 ✓ Preparing nodes 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Have a question, bug, or feature request? Let us know! https://kind.sigs.k8s.io/#community 🙂
```

`$ bash scripts/2-install-ingress.sh`

```
# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
"ingress-nginx" already exists with the same configuration, skipping
--------------------------------------------------------------------------

# helm repo update
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "ingress-nginx" chart repository
...Successfully got an update from the "traefik" chart repository
Update Complete. ⎈Happy Helming!⎈
--------------------------------------------------------------------------

helm install ingress-nginx ingress-nginx/ingress-nginx
  --namespace ingress-nginx --create-namespace \
  --set controller.kind=DaemonSet \
  --set controller.hostPort.enabled=true \
  --set-string controller.nodeSelector.ingress-ready=true \
  --set defaultBackend.enabled=true
NAME: ingress-nginx
LAST DEPLOYED: Sat Aug  9 02:03:26 2025
NAMESPACE: ingress-nginx
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
The ingress-nginx controller has been installed.
It may take a few minutes for the load balancer IP to be available.
You can watch the status by running 'kubectl get service --namespace ingress-nginx ingress-nginx-controller --output wide --watch'

An example Ingress that makes use of the controller:
  apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    name: example
    namespace: foo
  spec:
    ingressClassName: nginx
    rules:
      - host: www.example.com
        http:
          paths:
            - pathType: Prefix
              backend:
                service:
                  name: exampleService
                  port:
                    number: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
      - hosts:
        - www.example.com
        secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls
--------------------------------------------------------------------------
```

`$ bash scripts/3-create-namespace.sh`

```
kubectl apply -f manifests/k8s/1-namespace.yml
namespace/demo created

```

`$ bash scripts/4-create-apps-pods.sh`

```
kubectl apply -f manifests/k8s/2-app-demo.yml
deployment.apps/web created
service/web created
--------------------------------------------------------------------------


kubectl apply -f manifests/k8s/3-app-foo.yml
pod/foo-app created
service/foo-service created
--------------------------------------------------------------------------


kubectl apply -f manifests/k8s/4-app-bar.yml
pod/bar-app created
service/bar-service created
```

`$ bash scripts/5-create-ingress.sh`

```
kubectl apply -f manifests/k8s/5-ingress-apps.yml
ingress.networking.k8s.io/web created
```

`$ bash scripts/6-test-by-localhost.sh`
```
--------------------------------------------------------------------------
# testing: app-demo
curl localhost/
<html>
<head><title>503 Service Temporarily Unavailable</title></head>
<body>
<center><h1>503 Service Temporarily Unavailable</h1></center>
<hr><center>nginx</center>
</body>
</html>
--------------------------------------------------------------------------
# testing: app-foo
curl localhost/foo
<html>
<head><title>503 Service Temporarily Unavailable</title></head>
<body>
<center><h1>503 Service Temporarily Unavailable</h1></center>
<hr><center>nginx</center>
</body>
</html>

--------------------------------------------------------------------------
# testing: app-bar
curl localhost/bar
<html>
<head><title>503 Service Temporarily Unavailable</title></head>
<body>
<center><h1>503 Service Temporarily Unavailable</h1></center>
<hr><center>nginx</center>
</body>
</html>

--------------------------------------------------------------------------
```

`sleep 3s`

`$ bash scripts/6-test-by-localhost.sh`

```
--------------------------------------------------------------------------
# testing: app-demo
curl localhost/
hello from nginx ingress on kind
--------------------------------------------------------------------------
# testing: app-foo
curl localhost/foo
foo-app
--------------------------------------------------------------------------
# testing: app-bar
curl localhost/bar
bar-app
--------------------------------------------------------------------------
```
