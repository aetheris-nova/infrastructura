locals {
  portae_astrales_domain = "portaeastrales.sandbox"
  project_name           = "sandbox"
  repo_branch            = "beta"
}

#####
# project
#####

resource "digitalocean_project" "project" {
  name        = local.project_name
  description = "Services for the sandbox environment."
  purpose     = "Web Application"
  environment = "Staging"
  resources = [
    module.portae_astrales_app.urn
  ]
}

#####
# dns
#####

resource "digitalocean_record" "portae_astrales_app_domain" {
  domain = data.digitalocean_domain.domain.id
  name   = local.portae_astrales_domain
  type   = "CNAME"
  value  = module.portae_astrales_app.default_ingress
}

#####
# apps
#####

module "portae_astrales_app" {
  source = "../../modules/portae-astrales-app"

  app_region                = var.app_region
  digitalocean_access_token = var.digitalocean_access_token
  domain_name               = "${local.portae_astrales_domain}.${data.digitalocean_domain.domain.name}"
  doppler_service_token     = var.doppler_service_token_portae_astrales
  project_name              = local.project_name
  repo_branch               = local.repo_branch
}
