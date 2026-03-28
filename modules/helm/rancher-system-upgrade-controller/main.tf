# Helm release
resource "helm_release" "deployment" {
  name       = var.app_name
  namespace  = var.namespace
  repository = var.repo
  chart      = var.chart
  version    = var.ver

  set = [
    {
      name  = "priorityClassName"
      value = "rancher-critical"
    },
    {
      name  = "tolerations[0].key"
      value = "node-role.kubernetes.io/master"
    },
    {
      name  = "tolerations[0].operator"
      value = "Equal"
    },
    {
      name  = "tolerations[0].value"
      value = "true"
    },
    {
      name  = "tolerations[0].effect"
      value = "NoSchedule"
    }
  ]
}
