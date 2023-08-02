provider "digitalocean" {}

module "do_vpc" {
  count = 1

  source = "./modules/vpc"

  name     = "vpc-${var.vpc_name}-${var.region}"
  region   = var.region
  ip_range = var.ip_range
}

# Can only create 1 registry per DO account
module "do_container_registry" {
  count = 1

  source = "./modules/registry"

  name                   = "registry-${var.name}-${var.container_region}"
  subscription_tier_slug = "basic"
  region                 = var.container_region
}

module "kubernetes" {
  source = "./modules/doks"

  cluster_name = "cluster-${var.name}-${var.region}-${var.environment}"
  auto_upgrade = true
  region       = var.region
  vpc_uuid     = module.do_vpc[0].vpc_id
  size        = "s-1vcpu-2gb"
  auto_scale  = true
  min_nodes   = var.min_nodes
  max_nodes   = var.max_nodes
  node_labels = var.node_labels
  node_tags   = var.node_tags
}

# firewalls for kubernetes cluster
module "kubernetes_firewall" {
  source = "./modules/firewall"

  firewall_name = "firewall-${var.name}-${var.region}-${var.environment}"
  droplet_ids   = module.kubernetes.droplet_ids
}

terraform {
  cloud {
    organization = "stats19"

    workspaces {
      name = "do-express-app"
    }
  }
}
