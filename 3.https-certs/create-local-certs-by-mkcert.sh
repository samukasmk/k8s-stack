#!/bin/bash
#
echo "=========================================================================="
echo "# sudo apt update && sudo apt install -y mkcert"
echo "=========================================================================="

mkcert || sudo apt update && sudo apt install -y mkcert

echo
echo
echo "=========================================================================="
echo "# mkdir -p ./certs"
echo "=========================================================================="

mkdir -p ./certs

echo
echo
echo "=========================================================================="
echo "# mkcert -cert-file ./certs/tls.crt \\"
echo "    -key-file ./certs/tls.key \\"
echo "    '127.0.0.1' \\"
echo "    '1::' \\"
echo "    'localhost' \\"
echo "    '*.localhost' \\"
echo "    '*.local' \\"
echo "    '127-0-0-1.nip.io' \\"
echo "    '*.127-0-0-1.nip.io' \\"
echo "    '127.0.0.1.nip.io' \\"
echo "    '*.127.0.0.1.nip.io' \\"
echo "    'app.127.0.0.1.nip.io' \\"
echo "    '*.app.127.0.0.1.nip.io'"
echo "=========================================================================="

mkcert -cert-file ./certs/tls.crt \
    -key-file ./certs/tls.key \
    '127.0.0.1' \
    '1::' \
    'localhost' \
    '*.localhost' \
    '*.local' \
    '127-0-0-1.nip.io' \
    '*.127-0-0-1.nip.io' \
    '127.0.0.1.nip.io' \
    '*.127.0.0.1.nip.io' \
    'app.127.0.0.1.nip.io' \
    '*.app.127.0.0.1.nip.io'

echo
echo
echo "=========================================================================="
echo "kubectl create secret tls https-certs \\"
echo "  --cert=./certs/tls.crt \\"
echo "  --key=./certs/tls.key \\"
echo "  --dry-run=client -o yaml | kubectl apply -f -"
echo "=========================================================================="

kubectl create secret tls https-certs \
  --cert=./certs/tls.crt \
  --key=./certs/tls.key \
  --dry-run=client -o yaml | kubectl apply -f -

echo
echo
echo "=========================================================================="
echo '# kubectl get secrets https-certs'
echo "=========================================================================="

kubectl get secrets https-certs