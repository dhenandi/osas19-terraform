variable "label" {
  default = "opensuse-deployment"
}

variable "region" {
  default = "ap-south"
}

variable "image" {
  default = "linode/opensuse15.1"
}

variable "type" {
  default = "g6-nanode-1"
}

variable "stackscriptid" {
  default = "591700"
}


variable "rootpass" {}
variable "LINODE_TOKEN" {}