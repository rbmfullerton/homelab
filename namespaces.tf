resource "kubernetes_namespace" "uptimekuma" {
  metadata {
    name = "uptimekuma"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace" "servarr-internal" {
  metadata {
    name = "servarr-internal"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace" "ai" {
  metadata {
    name = "ai"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace" "pterodactyl" {
  metadata {
    name = "pterodactyl"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace" "cronjobs" {
  metadata {
    name = "cronjobs"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace" "pihole" {
  metadata {
    name = "pihole"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace" "pihole2" {
  metadata {
    name = "pihole2"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace" "servarr" {
  metadata {
    name = "servarr"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace" "authentik" {
  metadata {
    name = "authentik"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace" "traefik" {
  metadata {
    name = "traefik"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace" "cert-manager" {
  metadata {
    name = "cert-manager"
  }
  lifecycle {
    ignore_changes = [
      # Ignore rancher annotations
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
      metadata[0].annotations["field.cattle.io/projectId"],
      metadata[0].annotations["management.cattle.io/no-default-sa-token"],
      # Ignore Rancher labels
      metadata[0].labels["field.cattle.io/projectId"],
    ]
  }
}