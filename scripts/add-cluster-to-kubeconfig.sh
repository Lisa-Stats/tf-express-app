#! /usr/bin/bash

# Get the id of the kubernetes cluster (we know there's only 1 for now)
k8s_cluster_id=$(doctl kubernetes cluster list --no-header --format ID)

# Save the cluster info to kubeconfig
doctl kubernetes cluster kubeconfig save ${k8s_cluster_id}
