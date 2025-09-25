echo '=========================================================================='
echo "# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx"
echo '=========================================================================='
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

echo
echo
echo '=========================================================================='
echo "# helm repo update"
echo '=========================================================================='
helm repo update

echo
echo
echo '=========================================================================='
echo "# helm install ingress-nginx ingress-nginx/ingress-nginx \\"
echo "  --namespace ingress-nginx --create-namespace \\"
echo "  --set defaultBackend.enabled=true \\"
echo "  --set controller.kind=DaemonSet \\"
echo "  --set controller.hostPort.enabled=true \\"
echo "  --set controller.admissionWebhooks.enabled=true \\"
echo "  --set controller.admissionWebhooks.patch.enabled=true \\"
echo "  --set-string controller.nodeSelector.ingress-ready=true \\"
echo "  -f ./values/ingress-nginx.yaml"
echo '=========================================================================='
helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set defaultBackend.enabled=true \
  --set controller.kind=DaemonSet \
  --set controller.hostPort.enabled=true \
  --set controller.admissionWebhooks.enabled=true \
  --set controller.admissionWebhooks.patch.enabled=true \
  --set-string controller.nodeSelector.ingress-ready=true \
  -f ./values/ingress-nginx.yaml

# rotula TODOS os nodes do cluster com ingress-ready=true
echo
echo
echo '=========================================================================='
echo '# kubectl get nodes -o name | xargs -I {} kubectl label {} ingress-ready=true --overwrite'
echo '=========================================================================='

kubectl get nodes -o name | xargs -I {} kubectl label {} ingress-ready=true --overwrite


# Confirme que o controller subiu
echo
echo
echo '=========================================================================='
echo 'kubectl -n ingress-nginx rollout status ds/ingress-nginx-controller --timeout=180s'
echo '=========================================================================='

kubectl -n ingress-nginx rollout status ds/ingress-nginx-controller --timeout=180s


# checa pods
echo
echo
echo '=========================================================================='
echo 'kubectl -n ingress-nginx get pods -o wide'
echo '=========================================================================='

kubectl -n ingress-nginx get pods -o wide
