#!/bin/bash
# A script to deploy the application
echo "Starting deployment..."



# Pull the latest changes from the repository
git reset --hard && git pull origin main
chmod 777 * -R

# -------------------------- Deploy the blue version of the application --------------------------


kubectl create namespace blue || echo "Namespace 'blue' already exists."

# Deploy ingress 'nginx'
kubectl apply -f ingress/blue-ingress.yaml


# Deploy configmap
kubectl apply -f configmap/blue-configmap.yaml


# Deploy the blue version of the application
kubectl apply -f deployment/blue-deployment.yaml

# Expose the blue version of the application via a LoadBalancer service
kubectl apply -f deployment/blue-service.yaml

echo "Deployment completed successfully."

