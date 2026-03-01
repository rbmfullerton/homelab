variable "cert_name" {
  description = "The metadata name of the Certificate resource"
  type        = string
}

variable "namespace" {
  description = "The namespace where the Certificate and Secret will live"
  type        = string
}

variable "secret_name" {
  description = "The name of the Kubernetes secret where the certificate will be stored"
  type        = string
}

variable "common_name" {
  description = "The Common Name (CN) for the certificate"
  type        = string
  default     = "*.hozzlab.ca"
}

variable "dns_names" {
  description = "List of Subject Alternative Names (SANs)"
  type        = list(string)
  default     = ["*.hozzlab.ca", "hozzlab.ca"]
}