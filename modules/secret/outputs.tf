output "secret_arn" {
  value = aws_secretsmanager_secret.prod_secret.arn
}