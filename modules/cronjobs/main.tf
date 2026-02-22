resource "kubernetes_cron_job_v1" "curl_sonarrsearch" {
  metadata {
    name      = "curl-sonarrsearch"
    namespace = "cronjobs"

    labels = {
      app                          = "curl-sonarrsearch"
      "app.kubernetes.io/instance" = "curl-sonarrsearch"
    }
  }

  spec {
    schedule  = "0 6,12,16,22 * * *"
    timezone = "America/New_York"

    job_template {
      metadata {}
      spec {
        template {
          metadata {}
          spec {
            container {
              name  = "curl"
              image = "curlimages/curl:latest"

              command = ["/bin/sh", "-c"]

              args = [
                <<-EOT
                curl -d '{"name": "missingEpisodeSearch"}' \
                  -H "Content-Type: application/json" \
                  -X POST "http://sonarr.servarr:8989/api/v3/command?apikey=${var.sonarr_api_key}"
                EOT
              ]
            }

            restart_policy = "OnFailure"
          }
        }
      }
    }
  }
}