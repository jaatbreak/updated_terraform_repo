output "secret_arn" {
    value = data.aws_secretsmanager_secret.secrets.arn
  
}

# output "subnet_group_name" {
#     value = aws_db_subnet_group.rds_subnet_group.id
  
# }