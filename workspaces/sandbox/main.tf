locals {
  portae_astrales_domain = "portaeastrales.sandbox.aetherisnova.org"
  project_name           = "sandbox"
}

#####
# project
#####

resource "digitalocean_project" "project" {
  name        = local.project_name
  description = "Services for the sandbox environment."
  purpose     = "Service or API"
  environment = "Staging"
  resources = [
    module.portae_astrales_app.urn
  ]
}

#####
# apps
#####

module "portae_astrales_app" {
  source = "../../modules/portae-astrales-app"

  app_region          = var.app_region
  digital_ocean_token = var.digital_ocean_token
  domain_name         = local.portae_astrales_domain
  doppler_token       = var.doppler_token_portae_astrales
  project_name        = local.project_name
  repo_branch         = "beta"
}
