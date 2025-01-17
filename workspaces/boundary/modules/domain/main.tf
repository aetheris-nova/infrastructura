#####
# domains
#####

resource "digitalocean_domain" "domain" {
  name = var.domain
}
