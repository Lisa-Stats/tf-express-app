output "cluster_id" {
  value = digitalocean_kubernetes_cluster.doks.id
}

output "node_pool" {
  value = digitalocean_kubernetes_cluster.doks.node_pool
}

output "droplet_ids" {
  value = digitalocean_kubernetes_cluster.doks.node_pool[0].nodes[*].droplet_id
}
