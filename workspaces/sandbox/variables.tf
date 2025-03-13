#####
# required
#####

variable "digitalocean_access_token" {
  description = "A DigitalOcean personal access token."
  type        = string
}

variable "doppler_service_token_codex_aetherium" {
  type        = string
  description = "A service token to authenticate with the codex_aetherium project on Doppler."
}

variable "doppler_service_token_portae_astrales" {
  type        = string
  description = "A service token to authenticate with the portae_astrales project on Doppler."
}

#####
# optional
#####

# See https://slugs.do-api.dev/ for valid options.
variable "region" {
  default     = "ams3"
  description = "The region to deploy the infrastructure to."
  type        = string
}

variable "app_region" {
  description = "The region to deploy the Apps to."
  type        = string
  default     = "ams"
}
