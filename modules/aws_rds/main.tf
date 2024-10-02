

# Fetch the secret value for POSTGRES_PASSWORD
data "aws_secretsmanager_secret_version" "secret_version" {
  secret_id = var.secret_arn  # Get this from the 'secret' module output
}

# Decode the secret string (JSON) and extract the POSTGRES_PASSWORD
locals {
  secret_values = jsondecode(data.aws_secretsmanager_secret_version.secret_version.secret_string)
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
  db_name                =  "testdatabase"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = local.secret_values.POSTGRES_PASSWORD 
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = var.vpc_security_group_ids
#   vpc_security_group_ids = ["sg-00eb874bfa869a70e"]
  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Name = var.db_instance_name
  }
}