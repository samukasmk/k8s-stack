#!/bin/bash
#

pushd 1.cluster
bash create-cluster.sh sentry
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

pushd 7.sentry
bash install-sentry.sh
popd