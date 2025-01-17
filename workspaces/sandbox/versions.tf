terraform {
  # use terraform cloud to handle state
  cloud {
    organization = "aetherisnova"

    workspaces {
      name = "sandbox"
    }
  }

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }

    doppler = {
      source = "dopplerhq/doppler"
    }
  }
}
