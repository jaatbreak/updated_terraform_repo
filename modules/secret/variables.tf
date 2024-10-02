variable "aws_region" {
  description = "The AWS region where resources will be created"
  default     = "us-east-1"
}

variable "secret_name" {
  description = "The name of the secret in AWS Secrets Manager"
 
}

variable "django_private_key" {
  description = "Private key for Django"
  
}

variable "django_field_encryption_key" {
  description = "Field encryption key for Django"

}

variable "saml_x509_certificate" {
  description = "X509 Certificate for SAML"
  
}

variable "eve_user_access_key_id" {
  description = "Access key ID for EVE user"
 
}

variable "eve_user_secret_access_key" {
  description = "Secret access key for EVE user"
 
}

variable "postgres_password" {
  description = "Password for PostgreSQL"
 
}

variable "ac_key" {
  description = "Access key for AC"
 
}