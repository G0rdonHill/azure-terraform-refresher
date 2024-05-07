
variable "resource_prefix" {
  description = "Prefix for naming convention"
  type        = string
}

variable "az_region" {
  description = "Location of resources"
}

variable "env_tags" {
  type        = map(any)
  description = "Series of key:value tags to better describe resources"
}

variable "vm_admin_username" {
  type        = string
  description = "Admin username for remote access."
}

variable "vm_admin_public_key" {
  type        = string
  description = "Public SSH key used for remote access."
}