#!/bin/bash
#
sudo apt update && sudo apt install -y certbot

certbot certonly \
  --manual --preferred-challenges dns \
  --email samuel@smk.net.br \
  -d '*.smk.net.br' \
  --agree-tos \
  --staging

mkdir -p ./certs/smk.net.br

sudo cat /etc/letsencrypt/live/smk.net.br/fullchain.pem > ./certs/smk.net.br/fullchain.pem
sudo cat /etc/letsencrypt/live/smk.net.br/privkey.pem > ./certs/smk.net.br/privkey.pem

kubectl create secret tls https-certs \
  --cert=./certs/smk.net.br/fullchain.pem \
  --key=./certs/smk.net.br/privkey.pem \
  --dry-run=client -o yaml | kubectl apply -f -
