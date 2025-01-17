#####
# Required
#####

variable "app_region" {
  description = "The region of the app."
  type        = string
}

variable "digital_ocean_token" {
  description = "A DigitalOcean personal access token."
  type        = string
}

variable "domain_name" {
  description = "The domain name for the app."
  type        = string
}

variable "doppler_token" {
  description = "A Doppler service token used read secrets."
  type        = string
}

variable "project_name" {
  description = "The name of the project."
  type        = string
}
