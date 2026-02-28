variable "authentik_secret_key" {
  description = "Secret key for Authentik"
  type        = string
  sensitive   = true
}

variable "authentik_postgresql_password" {
  description = "Password for PostgreSQL"
  type        = string
  sensitive   = true
}

variable "storageClass" {
  description = "Storage class for persistence"
  type        = string
  default     = "longhorn"
}