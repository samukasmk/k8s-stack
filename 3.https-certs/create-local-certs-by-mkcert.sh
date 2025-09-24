#!/bin/bash
#
echo '# sudo apt update && sudo apt install -y mkcert'
sudo apt update && sudo apt install -y mkcert

echo
echo '# mkdir -p ./certs'
mkdir -p ./certs

echo
echo '# mkcert -cert-file ./certs/tls.crt \
    -key-file ./certs/tls.key \
    "127.0.0.1" \
    "1::" \
    "localhost" \
    "*.localhost" \
    "*.local" \
    "127-0-0-1.nip.io" \
    "*.127-0-0-1.nip.io" \
    "127.0.0.1.nip.io" \
    "*.127.0.0.1.nip.io"'
mkcert -cert-file ./certs/tls.crt \
    -key-file ./certs/tls.key \
    "127.0.0.1" \
    "1::" \
    "localhost" \
    "*.localhost" \
    "*.local" \
    "127-0-0-1.nip.io" \
    "*.127-0-0-1.nip.io" \
    "127.0.0.1.nip.io" \
    "*.127.0.0.1.nip.io"

echo '# kubectl create secret tls https-certs \
  --cert=./certs/tls.crt \
  --key=./certs/tls.key \
  --dry-run=client -o yaml | kubectl apply -f -'
kubectl create secret tls https-certs \
  --cert=./certs/tls.crt \
  --key=./certs/tls.key \
  --dry-run=client -o yaml | kubectl apply -f -

echo
echo '# kubectl get secrets https-certs'
kubectl get secrets https-certs