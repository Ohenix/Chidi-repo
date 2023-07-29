# this file contains all variables

/*this is variable*/

variable "vpc-cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "making vpc cidr variable"
}

variable "tenancy-state" {
  type        = string
  default     = "default"
  description = "making tenancy state variable."
}

variable "domain-change" {
  type        = bool
  default     = true
  description = "enabling dns"
}



variable "region-name" {
  type        = string
  default     = "eu-west-2"
  description = "making region variable."
}


variable "pub-cidr" {
  default     = "10.0.100.0/24"
}

variable "pub-cidr1" {
  default     = "10.0.170.0/24"
}

variable "az1" {
  default     = "eu-west-2a"
}



