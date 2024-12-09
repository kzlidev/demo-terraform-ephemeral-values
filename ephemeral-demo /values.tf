variable "prefix" {
  default = "likz"
  type    = string
}

variable "region" {
  default = "ap-southeast-1"
  type    = string
}

variable "secret" {
  type      = string
#  sensitive = true
  ephemeral = true
}