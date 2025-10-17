#!/bin/bash
#

# ask to sudo password in the beginning
sudo echo "Starting at: $(date)"

pushd 1.cluster
bash create-cluster.sh smk
popd

pushd 2.ingress
bash install-ingress.sh
popd

pushd 3.https-certs
bash create-local-certs-by-mkcert.sh
popd

pushd 3.https-certs
bash create-local-certs-by-mkcert.sh
popd

# pushd 6.apps
# bash create-apps.sh
# sleep 10
# bash test-by-domain.sh
# bash test-by-localhost.sh
# popd

# pushd 7.sentry
# bash install-sentry.sh
# popd

pushd 9.jitsi
bash install-jitsi.sh
popd