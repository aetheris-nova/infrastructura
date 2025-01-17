locals {
  app_name = "portae-astrales-app"
}

resource "digitalocean_app" "portae_astrales_app" {
  spec {
    name   = "${var.project_name}--${local.app_name}" # 2-32 character limit
    region = var.app_region

    domain {
      name = var.domain_name
    }

    static_site {
      build_command = "doppler run --mount .env -- pnpm -F @aetherisnova/portae-astrales build"
      name          = local.app_name
      output_dir    = "/dist/client"
      source_dir    = "/packages/portae-astrales"

      env {
        key   = "DOPPLER_TOKEN"
        scope = "BUILD_TIME"
        value = var.doppler_service_token
        type  = "SECRET"
      }

      github {
        branch         = var.repo_branch
        deploy_on_push = true
        repo           = "aetheris-nova/structura-contractus"
      }
    }
  }
}
