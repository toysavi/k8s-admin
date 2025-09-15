#!/bin/bash
# A script to deploy the application
echo "Starting deployment..."

# Pull the latest changes from the repository
git fetch origin && git checkout main

echo "Pulled latest changes from repository."

# Deploy ingress 'nginx'
kubectl apply -f ingress/blue-ingress.yaml
echo "Deployed ingress 'nginx'."

# Deploy configmap
kubectl apply -f configmap/blue-configmap.yaml
echo "Deployed configmap."

# Deploy the blue version of the application
kubectl apply -f deployment/blue-deployment.yaml
echo "Deployed blue version of the application."

echo "Deployment completed successfully."

