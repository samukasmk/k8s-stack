kubectl apply -f ./manifests/1.canary-base-app-deploy.yaml
kubectl apply -f ./manifests/2.canary-deploy.yaml
kubectl apply -f ./manifests/3.base-ingress.yaml
kubectl apply -f ./manifests/4.canary-ingress.yaml



for i in $(seq 1 10); do curl -s --resolve canary.127.0.0.1.nip.io:80:24.144.71.37 canary.127.0.0.1.nip.io; done | grep -o '<span id='\'podName\''>[^<]*' | sed 's/<[^>]*>//g'
# base-app-5dbddc57c5-n8l5q
# base-app-5dbddc57c5-n8l5q
# canary-app-ccb44d45c-qdpkz
# base-app-5dbddc57c5-n8l5q
# base-app-5dbddc57c5-n8l5q
# base-app-5dbddc57c5-n8l5q
# canary-app-ccb44d45c-qdpkz
# canary-app-ccb44d45c-qdpkz
# base-app-5dbddc57c5-n8l5q
# base-app-5dbddc57c5-n8l5q