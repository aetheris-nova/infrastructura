#####
# required
#####

variable "app_region" {
  description = "The region of the app."
  type        = string
}

variable "digitalocean_access_token" {
  description = "A DigitalOcean personal access token."
  type        = string
}

variable "domain_name" {
  description = "The domain name."
  type        = string
}

variable "doppler_service_token" {
  description = "A Doppler service token used read secrets."
  type        = string
}

variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "repo_branch" {
  description = "The branch of the repo to use."
  type        = string
}

variable "zone" {
  description = "The top-level domain name."
  type        = string
}
