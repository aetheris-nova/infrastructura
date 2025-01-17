locals {
  app_name = "portae-astrales-app"
}

resource "digitalocean_app" "app" {
  spec {
    name   = "${var.project_name}--${local.app_name}" # 2-32 character limit
    region = var.app_region

    domain {
      name = var.domain_name
    }

    static_site {
      build_command = "pnpm -F @aetherisnova/portae-astrales build"
      name          = local.app_name
      output_dir    = "/dist/client"
      source_dir    = "/packages/portae-astrales"

      env {
        key   = "VITE_WORLD_API_HTTP_URL"
        scope = "BUILD_TIME"
        value = nonsensitive(data.doppler_secrets.portae_astrales.map.VITE_WORLD_API_HTTP_URL)
        type  = "GENERAL"
      }

      env {
        key   = "VITE_WORLD_API_WS_URL"
        scope = "BUILD_TIME"
        value = nonsensitive(data.doppler_secrets.portae_astrales.map.VITE_WORLD_API_WS_URL)
        type  = "GENERAL"
      }

      github {
        branch         = var.repo_branch
        deploy_on_push = true
        repo           = "aetheris-nova/structura-contractus"
      }
    }
  }
}
