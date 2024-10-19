provider "aws" {
  region = var.aws_region
}

resource "random_id" "random_suffix" {
  byte_length = 3  # Generates 3 random bytes, which will be converted to a 6-character hex string
}
resource "aws_secretsmanager_secret" "prod_secret" {
  name        = "${var.secret_name}-${random_id.random_suffix.hex}"
  description = "Secrets for production environment"
}

resource "aws_secretsmanager_secret_version" "prod_secret_version" {
  secret_id     = aws_secretsmanager_secret.prod_secret.id
  secret_string = jsonencode({
    # DJANGO_PRIVATE_KEY            = var.django_private_key,
    # DJANGO_FIELD_ENCRYPTION_KEY   = var.django_field_encryption_key,
    # SAML_X509_CERTIFICATE         = var.saml_x509_certificate,
    # EVE_USER_ACCESS_KEY_ID        = var.eve_user_access_key_id,
    # EVE_USER_SECRET_ACCESS_KEY    = var.eve_user_secret_access_key,
    # POSTGRES_PASSWORD             = var.postgres_password,
    # AC_KEY                        = var.ac_key
  })
}