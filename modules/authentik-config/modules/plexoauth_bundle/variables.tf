variable "app_name" {
  type = string
  description = "Human friendly application name."
}

variable "app_slug" {
  type = string
  description = "Machine friendly application name."
}

variable "app_external_host" {
  type = string
  description = "External URL for the application."
}

variable "token_validity" {
  type = string
  description = "token validity time"
}

