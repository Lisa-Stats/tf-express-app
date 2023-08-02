# General
variable "environment" {
  type = string
}

variable "name" {
  type = string
}

variable "region" {
  type = string
}

# VPC
variable "vpc_name" {
  type = string
}

variable "ip_range" {
  type = string
}

# Container
variable "container_region" {
  type = string
}

# DOKS
variable "min_nodes" {
  type = number
}

variable "max_nodes" {
  type = number
}

variable "node_labels" {
  type = map(any)
}

variable "node_tags" {
  type = list(any)
}
