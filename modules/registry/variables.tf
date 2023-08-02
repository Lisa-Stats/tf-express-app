variable "name" {
  description = "The name of the container registry"
  type        = string
}

variable "subscription_tier_slug" {
  description = "The slug identifier for the subscription tier to use. (starter, basic, or professional)"
  type        = string
}

variable "region" {
  description = "The slug identifier for the region where the registry will be stored (tor1 not available)"
  type        = string
}
