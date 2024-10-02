
# Neptune Subnet Group
resource "aws_neptune_subnet_group" "neptune_subnet_group" {
  name       = var.neptune_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.neptune_subnet_group_name
  }
}

# Optional: Neptune Parameter Group
resource "aws_neptune_parameter_group" "neptune_parameter_group" {
  name        = var.neptune_parameter_group_name
  family      = "neptune1"
  description = "Custom parameter group for Neptune cluster"

  parameter {
    name  = "neptune_query_timeout"
    value = "120000"
  }

  tags = {
    Name = var.neptune_parameter_group_name
  }
}

# Neptune Security Group
resource "aws_security_group" "neptune_sg" {
  name        = var.neptune_security_group_name
  description = "Security group for Neptune cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8182
    to_port     = 8182
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.neptune_security_group_name
  }
}

# Neptune Cluster
resource "aws_neptune_cluster" "neptune_cluster" {
  cluster_identifier      = var.neptune_cluster_identifier
  engine                  = "neptune"
  neptune_subnet_group_name = aws_neptune_subnet_group.neptune_subnet_group.name
  vpc_security_group_ids   = [aws_security_group.neptune_sg.id]

  backup_retention_period  = var.backup_retention_period
  preferred_backup_window  = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  skip_final_snapshot      = true
  apply_immediately        = true

  tags = {
    Name = var.neptune_cluster_identifier
  }
}

# Neptune Cluster Instances
resource "aws_neptune_cluster_instance" "neptune_instance" {
  count               = var.instance_count
  cluster_identifier  = aws_neptune_cluster.neptune_cluster.cluster_identifier
  instance_class      = var.instance_class
  engine              = "neptune"
  apply_immediately   = true

  tags = {
    Name = "${var.neptune_cluster_identifier}-instance-${count.index + 1}"
  }
}