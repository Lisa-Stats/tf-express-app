# Terraform config on DigitalOcean for [express app](https://github.com/Lisa-Stats/express-app-helm-charts/tree/main)
## General setup
### Creates using terraform modules:
- VPC
- Container registry
- DOKS cluster
  - 1 managed node pool
  - k8s cluster firewall
### Backend and workflow
- Uses `terraform cloud` as the backend
  - encrypts data at-rest and in-transit
- Has a cli workflow with `tf cloud workspace` as the backend
  - Whenever there is a new commit a plan will run and then either applied or discarded
  - With new PRs a `speculative plan` is opened against that branch

### Connecting the DOKS cluster to a container registry
- Use the `doctl` registry command to download the credentials for your container registry and output the secret to the appropriate file
```
doctl registry kubernetes-manifest
```
