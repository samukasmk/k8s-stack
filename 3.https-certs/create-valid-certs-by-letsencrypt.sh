#!/bin/bash
#
echo "=========================================================================="
echo "# sudo apt update && sudo apt install -y certbot"
echo "=========================================================================="

sudo apt update && sudo apt install -y certbot

echo
echo
echo "=========================================================================="
echo "# certbot certonly \\"
echo "  --manual --preferred-challenges dns \\"
echo "  --email samuel@smk.net.br \\"
echo "  -d '*.smk.net.br' \\"
echo "  --agree-tos \\"
echo "  --staging"
echo "=========================================================================="

certbot certonly \
  --manual --preferred-challenges dns \
  --email samuel@smk.net.br \
  -d '*.smk.net.br' \
  --agree-tos \
  --staging

echo
echo
echo "=========================================================================="
echo "# mkdir -p ./certs"
echo "=========================================================================="

mkdir -p ./certs

echo
echo
echo "=========================================================================="
echo "# sudo cat /etc/letsencrypt/live/smk.net.br/fullchain.pem > ./certs/letsencrypt-fullchain.pem"
echo "# sudo cat /etc/letsencrypt/live/smk.net.br/privkey.pem > ./certs/letsencrypt-privkey.pem"
echo "=========================================================================="

sudo cat /etc/letsencrypt/live/smk.net.br/fullchain.pem > ./certs/letsencrypt-fullchain.pem
sudo cat /etc/letsencrypt/live/smk.net.br/privkey.pem > ./certs/letsencrypt-privkey.pem


echo
echo
echo "=========================================================================="
echo "# kubectl create secret tls https-certs \\"
echo "  --cert=./certs/letsencrypt-fullchain.pem \\"
echo "  --key=./certs/letsencrypt-privkey.pem \\"
echo "  --dry-run=client -o yaml | kubectl apply -f -"
echo "=========================================================================="

kubectl create secret tls https-certs \
  --cert=./certs/letsencrypt-fullchain.pem \
  --key=./certs/letsencrypt-privkey.pem \
  --dry-run=client -o yaml | kubectl apply -f -
