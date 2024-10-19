# AWS Provider Configuration
provider "aws" {
  region = "us-east-1"  # Specify the region for AWS resources
}

# Fetch the secret from AWS Secrets Manager
data "aws_secretsmanager_secret" "secrets" {
  arn = var.secret_arn  # Secret ARN
}

# Fetch the latest version of the secret
data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}

# Decode the secret value (which is a JSON string) and extract the POSTGRES_PASSWORD
locals {
  secret_values = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)
}

# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.subnet_group_name
  }
}

# RDS PostgreSQL Instance
resource "aws_db_instance" "postgres_rds" {
  identifier             = var.db_instance_name
  allocated_storage      = var.allocated_storage
  engine                 = "postgres"
  db_name                = "testdatabase"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = local.secret_values["postgres_password"]  # Extracted password from Secrets Manager
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Name = var.db_instance_name
  }
}
