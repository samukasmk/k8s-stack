#!/bin/bash
#

# install sentry by helm

echo "=========================================================================="
echo "# helm repo add sentry https://sentry-kubernetes.github.io/charts"
echo "=========================================================================="

helm repo add sentry https://sentry-kubernetes.github.io/charts


echo
echo
echo "=========================================================================="
echo "# helm repo update"
echo "=========================================================================="

helm repo update


echo
echo
echo "=========================================================================="
echo "# helm install my-sentry sentry/sentry --wait --timeout=1000s -f values/sentry.yaml -n default"
echo "=========================================================================="

helm install my-sentry sentry/sentry --wait --timeout=1000s -f values/sentry.yaml -n default