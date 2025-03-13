provider "digitalocean" {
  token = var.digitalocean_access_token
}

provider "doppler" {
  doppler_token = var.doppler_service_token
}
