resource "digitalocean_firewall" "doks" {
  name        = var.firewall_name
  droplet_ids = var.droplet_ids
  # allow private traffic
  inbound_rule {
    protocol         = "tcp"
    port_range       = "1-65535"
    source_addresses = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  }

  # allow outbound private traffic
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"                                         # TODO - more specific
    destination_addresses = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"] # TODO - does this need to be more public?
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"                                         # TODO - more specific
    destination_addresses = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"] # TODO - does this need to be more public?
  }

  # allow ICMP
  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0"]
  }
}
