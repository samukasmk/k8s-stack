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
echo "  --set controller.kind=DaemonSet \\"
echo "  --set controller.hostPort.enabled=true \\"
echo "  --set-string controller.nodeSelector.ingress-ready=true \\"
echo "  --set defaultBackend.enabled=true"
echo '=========================================================================='
helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set controller.kind=DaemonSet \
  --set controller.hostPort.enabled=true \
  --set-string controller.nodeSelector.ingress-ready=true \
  --set defaultBackend.enabled=true

