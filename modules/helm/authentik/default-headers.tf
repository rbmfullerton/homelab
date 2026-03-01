resource "kubernetes_manifest" "default_headers_middleware" {
  manifest = {
    apiVersion = "traefik.io/v1alpha1"
    kind       = "Middleware"

    metadata = {
      name      = "default-headers"
      namespace = "authentik"
    }
    spec = {
      forwardAuth = {
        address = "http://ak-outpost-apps.authentik.svc.cluster.local:9000/outpost.goauthentik.io/auth/traefik"
        trustForwardHeader = true
        authResponseHeaders = [
          "X-authentik-username",
          "X-authentik-groups",
          "X-authentik-entitlements",
          "X-authentik-email",
          "X-authentik-name",
          "X-authentik-uid",
          "X-authentik-jwt",
          "X-authentik-meta-jwks",
          "X-authentik-meta-outpost",
          "X-authentik-meta-provider",
          "X-authentik-meta-app",
          "X-authentik-meta-version",
        ]
      }
    }
  }
}
