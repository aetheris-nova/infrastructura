provider "digitalocean" {
  token = var.digitalocean_access_token
}

provider "doppler" {
  alias         = "portae_astrales"
  doppler_token = var.doppler_service_token_portae_astrales
}
