resource "kubernetes_manifest" "letsencrypt_production" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt-production"
    }
    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email  = "hozz@hotmail.ca"
        privateKeySecretRef = {
          name = "letsencrypt-production"
        }
        solvers = [
          {
            dns01 = {
              cloudflare = {
                email = "hozz@hotmail.ca"
                apiTokenSecretRef = {
                  name = "cloudflare-token-secret"
                  key  = "cloudflare-token"
                }
              }
            }
            selector = {
              dnsZones = ["hozzlab.ca"]
            }
          }
        ]
      }
    }
  }
}