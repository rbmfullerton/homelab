#servarr
resource "kubernetes_persistent_volume" "smb-tvshows" {
  metadata {
    name = "smb-tvshows"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-tvshows"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-tvshows"

        volume_attributes = {
          source = "//10.0.0.45/TVShows"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "smb-tvshows" {
  metadata {
    name      = "smb-tvshows"
    namespace = "servarr"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-tvshows"
    storage_class_name = "smb-tvshows"
  }
}

resource "kubernetes_persistent_volume" "smb-movies" {
  metadata {
    name = "smb-movies"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-movies"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-movies"

        volume_attributes = {
          source = "//10.0.0.45/Movies"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "smb-movies" {
  metadata {
    name      = "smb-movies"
    namespace = "servarr"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-movies"
    storage_class_name = "smb-movies"
  }
}








#servarr-internal

resource "kubernetes_persistent_volume" "smb-tvshows-internal" {
  metadata {
    name = "smb-tvshows-internal"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-tvshows"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-tvshows-internal"

        volume_attributes = {
          source = "//10.0.0.45/TVShows"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "smb-tvshows-internal" {
  metadata {
    name      = "smb-tvshows-internal"
    namespace = "servarr-internal"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-tvshows-internal"
    storage_class_name = "smb-tvshows"
  }
}

resource "kubernetes_persistent_volume" "smb-movies-internal" {
  metadata {
    name = "smb-movies-internal"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-movies"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-movies-internal"

        volume_attributes = {
          source = "//10.0.0.45/Movies"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "smb-movies-internal" {
  metadata {
    name      = "smb-movies-internal"
    namespace = "servarr-internal"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-movies-internal"
    storage_class_name = "smb-movies"
  }
}
