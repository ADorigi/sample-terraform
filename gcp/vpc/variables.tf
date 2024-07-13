# vpc variables

variable "vpc_name" {
  type = string
}

variable "routing_mode" {
  type    = string
  default = "GLOBAL"
}


variable "mtu" {
  description = "Maximum transmission unit" # (https://cloud.google.com/vpc/docs/mtu)
  type = number
}


# subnet variables

variable "subnet_name" {
  type = string
}

variable "ip_cidr_range" {
  type = string
}

variable "region" {
  type = string
}

variable "private_ip_access" {
  type = bool
}

variable "secondary_ip_range_names" {
  type    = list(string)
  default = []
}
variable "secondary_ip_ranges" {
  type    = list(string)
  default = []
}