resource "kubernetes_manifest" "ingressroute" {
  manifest = {
    "apiVersion" = "traefik.io/v1alpha1"
    "kind" = "IngressRoute"
    "metadata" = {
      "annotations" = {
        "kubernetes.io/ingress.class" = "traefik-external"
      }
      "name" =  "authentik-outpost"
      "namespace" = "authentik"
    }
    "spec" = {
      "entryPoints" = [
        "websecure",
      ]
      "routes" = [
        {
          "kind" = "Rule"
          "match" = "Host(`*.hozzlab.ca`) && PathPrefix(`/outpost.goauthentik.io/`)"
          "priority" = 15
          "services" = [
            {
              "name" = "ak-outpost-apps"
              "port" = 9000
            }
          ]
        },
        {
          "kind" = "Rule"
          "match" = "Host(`authentik.hozzlab.ca`) && PathPrefix(`/`)"
          "priority" = 5
          "services" = [
            {
              "name" = "authentik-server"
              "port" = 9000
            }
          ]
        }
      ]
      "tls" = {
        "secretName" = "hozzlab-tls"
      }
    }
  }
}

