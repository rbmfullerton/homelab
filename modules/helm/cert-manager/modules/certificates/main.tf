resource "kubernetes_manifest" "cert" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Certificate"
    metadata = {
      name      = var.cert_name
      namespace = var.namespace
    }
    spec = {
      secretName = var.secret_name
      issuerRef = {
        name = "letsencrypt-production"
        kind = "ClusterIssuer"
      }
      commonName = var.common_name
      dnsNames    = var.dns_names
    }
  }
}