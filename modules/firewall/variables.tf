variable "firewall_name" {
  description = "The name of the firewall for the default doks node pool"
  type        = string
}

variable "droplet_ids" {
  description = "The ids of the droplet in the default node pool"
  type        = list(any)
}
