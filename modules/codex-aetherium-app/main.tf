locals {
  app_name = "codex-aetherium-app"
}

resource "digitalocean_app" "app" {
  spec {
    name   = "${var.project_name}--${local.app_name}" # 2-32 character limit
    region = var.app_region

    domain {
      name = var.domain_name
      type = "PRIMARY"
    }

    static_site {
      build_command     = "pnpm -F @aetherisnova/codex-aetherium build"
      catchall_document = "index.html"
      name              = local.app_name
      output_dir        = "/packages/codex-aetherium/dist"

      env {
        key   = "VITE_TITLE"
        scope = "BUILD_TIME"
        value = nonsensitive(data.doppler_secrets.codex_aetherium.map.VITE_TITLE)
        type  = "GENERAL"
      }

      env {
        key   = "VITE_WORLD_API_HTTP_URL"
        scope = "BUILD_TIME"
        value = nonsensitive(data.doppler_secrets.codex_aetherium.map.VITE_WORLD_API_HTTP_URL)
        type  = "GENERAL"
      }

      env {
        key   = "VITE_WORLD_API_WS_URL"
        scope = "BUILD_TIME"
        value = nonsensitive(data.doppler_secrets.codex_aetherium.map.VITE_WORLD_API_WS_URL)
        type  = "GENERAL"
      }

      github {
        branch         = var.repo_branch
        deploy_on_push = true
        repo           = "aetheris-nova/regimen-contractus"
      }
    }
  }
}
