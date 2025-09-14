# Deployment Proof

This folder contains screenshots demonstrating successful deployment:

## Required Screenshots:
1. **jenkins-pipeline-success.png** - Jenkins build success page
2. **argocd-deployment.png** - ArgoCD application status showing healthy deployment
3. **app-running.png** - Browser showing the deployed application
4. **kubernetes-pods.png** - kubectl get pods showing running pods

## How to take screenshots:

### 1. Jenkins Pipeline Success
- Go to Jenkins → Your Job → Build History → Latest Build
- Screenshot the "Console Output" showing "BUILD SUCCESS"

### 2. ArgoCD Deployment
- Open ArgoCD UI
- Navigate to Applications → swayatt-logo-server
- Screenshot showing "Healthy" and "Synced" status

### 3. App Running
- Open browser and navigate to your deployed app URL
- Screenshot showing the Swayatt logo

### 4. Kubernetes Pods
- Run: `kubectl get pods -n default`
- Screenshot the terminal output showing running pods

**Note**: Add actual screenshot files here before final submission.
