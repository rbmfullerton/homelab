provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Helm release resource for deploying Authentik
resource "helm_release" "authentik" {
  name       = "authentik"
  namespace  = "authentik"
  repository = "https://charts.goauthentik.io"
  chart      = "authentik"
  version    = "2026.2.0"

  values = [
    yamlencode({
      authentik = {
        secret_key       = var.authentik_secret_key
        error_reporting  = { enabled = true }
        postgresql = {
          password = var.authentik_postgresql_password
        }
      },
      server = {
        ingress = {
          ingressClassName = "traefik"
          enabled          = true
          hosts            = ["authentik.hozzlab.ca"]
        },
        affinity = {
          nodeAffinity = {
            requiredDuringSchedulingIgnoredDuringExecution = {
              nodeSelectorTerms = [
                {
                  matchExpressions = [
                    {
                      key      = "worker"
                      operator = "In"
                      values   = ["true"]
                    }
                  ]
                }
              ]
            }
          }
        }
      },
      worker = {
        affinity = {
          nodeAffinity = {
            requiredDuringSchedulingIgnoredDuringExecution = {
              nodeSelectorTerms = [
                {
                  matchExpressions = [
                    {
                      key      = "worker"
                      operator = "In"
                      values   = ["true"]
                    }
                  ]
                }
              ]
            }
          }
        }
      },
      postgresql = {
        enabled = true
        auth = {
          password = var.authentik_postgresql_password
        }
        affinity = {
          nodeAffinity = {
            requiredDuringSchedulingIgnoredDuringExecution = {
              nodeSelectorTerms = [
                {
                  matchExpressions = [
                    {
                      key      = "worker"
                      operator = "In"
                      values   = ["true"]
                    }
                  ]
                }
              ]
            }
          }
        }
      },
      persistence = {
        storageClass = var.storageClass
      }
    })
  ]

  create_namespace = false
}
