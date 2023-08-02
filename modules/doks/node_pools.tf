resource "digitalocean_kubernetes_node_pool" "node_pools" {
  for_each = var.node_pools

  cluster_id = digitalocean_kubernetes_cluster.doks.id

  name       = format("%s-%s", var.cluster_name, each.key)
  size       = each.value.size
  auto_scale = each.value.auto_scale
  min_nodes  = each.value.min_nodes
  max_nodes  = each.value.max_nodes
  tags       = each.value.node_tags
  labels     = each.value.node_labels
}
