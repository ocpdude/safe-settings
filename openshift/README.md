# Deploy Safe-Setting to OpenShift (OKD)
## Prerequisites
- Create a namespace for the deployment
  - oc new-project safe-settings
- Create a service account for the deployment
  - oc create -f rbac.yaml
- Create a secret using the .env file
  - oc create secret generic app-env --from-env-file=.env
- Build the Docker image and push it to a registry - or deploy ghcr.io/ocpdude/safe-settings:latest
  - docker build -t $REGISTRY_URL/safe-settings .
  - docker push $REGISTRY_URL/safe-settings

## Deploying the application
- Create the deployment using the deployment.yaml file
- Create the service using the service.yaml file


## Troublshooting
- Search for available NodePorts
  - oc get pods -l deployment -o "custom-columns=NAME:.metadata.name,SCC:.metadata.annotations.openshift\.io/scc,SERVICEACCOUNT:.spec.serviceAccountName" --all-namespaces

  