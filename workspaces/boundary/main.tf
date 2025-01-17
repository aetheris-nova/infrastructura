locals {
  domain       = "aetherisnova.org"
  project_name = "boundary"
}
#####
# project
#####

resource "digitalocean_project" "project" {
  name        = local.project_name
  description = "Organization wide infrastructure."
  purpose     = "Operational / Developer tooling"
  environment = "Production"
  resources = [
    module.domain.urn
  ]
}

#####
# dns
#####

module "domain" {
  source = "./modules/domain"

  digitalocean_access_token = var.digitalocean_access_token
  domain                    = local.domain
}
