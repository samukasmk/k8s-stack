#!/bin/bash
#
CLUSTER_NAME=$1
if [ -z "$CLUSTER_NAME" ]; then
	echo "Error: Cluster name is undefined. Please define a cluster name."
	echo "Example: $0 <cluster_name>"
	exit 1
fi

echo '=========================================================================='
echo "# kind create cluster --name \"$CLUSTER_NAME\" --config ./manifests/kind.yml"
echo '=========================================================================='
kind create cluster --name "$CLUSTER_NAME" --config ./manifests/kind.yml

