#!/bin/bash
echo "Starting deployment..."

kubectl create namespace blue || echo "Namespace 'blue' already exists."

# Deploy ingress
kubectl apply -f ingress/blue-ingress.yaml

# Deploy ConfigMap
kubectl apply -f configmap/blue-configmap.yaml

# Deploy the application and trigger rollout by updating annotation
REVISION=$(date +%s)
kubectl patch deployment blue-page -n blue -p "{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"configmap.revision\":\"$REVISION\"}}}}}"

# Ensure service exists
kubectl apply -f deployment/blue-service.yaml

echo "Deployment completed successfully."
