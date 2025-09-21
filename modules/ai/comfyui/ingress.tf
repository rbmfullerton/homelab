resource "kubernetes_manifest" "ingressroute" {
  manifest = {
    "apiVersion" = "traefik.io/v1alpha1"
    "kind" = "IngressRoute"
    "metadata" = {
      "annotations" = {
        "kubernetes.io/ingress.class" = "traefik-external"
      }
      "name" =  "comfyui-nvidia"
      "namespace" = "ai"
    }
    "spec" = {
      "entryPoints" = [
        "websecure",
      ]
      "routes" = [
        {
          "kind" = "Rule"
          "match" = "Host(`comfyui.hozzlab.ca`)"
          "middlewares" = [
            {
              "name" = "default-headers"
              "namespace" = "authentik"
            },
          ]
          "priority" = 10
          "services" = [
            {
              "name" = "comfyui-nvidia"
              "port" = "8188"
            },
          ]
        },
      ]
      "tls" = {
        "secretName" = "hozzlab-tls"
      }
    }
  }
}

