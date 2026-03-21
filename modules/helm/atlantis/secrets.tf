resource "kubernetes_secret_v1" "atlantis_terraform_secrets" {
  metadata {
    name      = "atlantis-terraform-vars"
    namespace = var.namespace
  }

  # Map your secrets to TF_VAR_ names so Terraform sees them automatically
  data = {
    "TF_VAR_authentik_token"  = var.authentik_token
    "TF_VAR_cloudflare-token" = var.cloudflare-token
    "TF_VAR_authentik_host" = var.authentik_host
    "TF_VAR_rancher_api_token" = var.rancher_api_token
    "TF_VAR_pihole1_api_token" = var.pihole1_api_token
    "TF_VAR_pihole2_api_token" = var.pihole2_api_token
    "TF_VAR_pihole3_api_token" = var.pihole3_api_token
    "TF_VAR_sonarr_api_key" = var.sonarr_api_key
    "TF_VAR_authentik_secret_key" = var.authentik_secret_key
    "TF_VAR_authentik_postgresql_password" = var.authentik_postgresql_password
    "TF_VAR_traefik-dashboard-auth" = var.traefik-dashboard-auth
    "TF_VAR_atlantis-githubAppSecret" = var.atlantis-githubAppSecret
  }

  type = "Opaque"
}