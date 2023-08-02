resource "digitalocean_container_registry" "registry" {
  name                   = var.name
  subscription_tier_slug = var.subscription_tier_slug
  region                 = var.region
}
