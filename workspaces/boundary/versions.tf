terraform {
  # use terraform cloud to handle state
  cloud {
    organization = "aetherisnova"

    workspaces {
      name = "boundary"
    }
  }

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}
