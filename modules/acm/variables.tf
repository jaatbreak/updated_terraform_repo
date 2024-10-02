# modules/acm/variables.tf
variable "domain_name" {
  description = "The domain name for which to request the ACM certificate"
  type        = string
}

variable "subject_alternative_names" {
  description = "Optional alternative domain names for the certificate"
  type        = list(string)
  default     = []
}

variable "certificate_arn" {
  type = string
  
}
