# Deployment
resource "kubernetes_deployment" "deployment" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = var.app_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }
      spec {
        node_selector = {
          worker = "true"
        }
        container {
          image           = "${var.image}:${var.image_version}"
          image_pull_policy = "IfNotPresent"
          name            = var.app_name
          port {
            container_port  = var.port
            name              = "port"
            protocol          = var.protocol
          }
        }
      }
    }
  }
}

# Service
resource "kubernetes_service" "service" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }
  spec {
    port {
      name       = "port"
      port       = var.port
      protocol   = var.protocol
      target_port = var.port
    }
    selector = {
      app = var.app_name
    }
    type = "ClusterIP"
  }
}