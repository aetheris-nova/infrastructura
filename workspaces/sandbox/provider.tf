provider "digitalocean" {
  token = var.digital_ocean_token
}

provider "doppler" {
  alias         = "portae_astrales"
  doppler_token = var.doppler_token_portae_astrales
}
