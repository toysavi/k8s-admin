#!/bin/bash

# A script to build the application
echo "Starting build ingress nginx..."
sudo build/ingress-nginx.sh
echo "Ingress NGINX built successfully."

# Build metaLB LoadBalancer
echo "Starting build metallb..."
kubectl apply -f build/metallb-systsem.yaml

echo "Metallb built successfully."

echo "Build completed successfully."
