#####
# required
#####

variable "digitalocean_access_token" {
  description = "A Digital Ocean personal access token"
  type        = string
}

variable "domain" {
  description = "The domain for this resource"
  type        = string
}
