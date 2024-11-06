variable "alb_name" {
  description = "Name of internal ALB"
  type        = string
}

variable "enable_deletion_protection" {
  type    = bool
  default = true
}

variable "logs_bucket" {
  description = "Name of bucket where we would be storing our logs"
  default     = "traya-tf-state"


}

variable "enable_logging" {
  type    = bool
  default = false

}

variable "alb_certificate_arn" {
  type        = string
  description = "Certificate arn"
  default     = null
}

variable "region" {
  type        = string
  description = "Region where resource will be created."
}

variable "tags" {
  description = "Additional tags for the EC2 instances"
  type        = map(string)
  default     = {}
}
variable "ovpn_ip" {
  description = "Public IP of the OpenVPN Instance"
  type = string
  default = ""
}