resource "kubernetes_namespace" "uptimekuma" {
  metadata {
    name = "uptimekuma"
  }
}

resource "kubernetes_namespace" "servarr-internal" {
  metadata {
    name = "servarr-internal"
  }
}

resource "kubernetes_namespace" "ai" {
  metadata {
    name = "ai"
  }
}

resource "kubernetes_namespace" "pterodactyl" {
  metadata {
    name = "pterodactyl"
  }
}

resource "kubernetes_namespace" "cronjobs" {
  metadata {
    name = "cronjobs"
  }
}

resource "kubernetes_namespace" "pihole" {
  metadata {
    name = "pihole"
  }
}

resource "kubernetes_namespace" "pihole2" {
  metadata {
    name = "pihole2"
  }
}

resource "kubernetes_namespace" "servarr" {
  metadata {
    name = "servarr"
  }
}