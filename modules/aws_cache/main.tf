provider "aws" {
  region = "us-east-1"
}

resource "aws_elasticache_replication_group" "redis_cluster" {
  description = "define about the aws elastic cache"
  replication_group_id          = var.cluster_name
  node_type                     = var.node_type
  engine                        = "redis"
  engine_version                = var.engine_version
  parameter_group_name          = var.parameter_group_name
  port                          = var.port
  automatic_failover_enabled    = var.auto_failover
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled

  subnet_group_name             = aws_elasticache_subnet_group.redis_subnet_group.id
  security_group_ids            = var.vpc_security_group_ids

  tags = {
    Name = var.cluster_name
    Env  = "QA"
  }
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids # Replace with actual subnet IDs

  tags = {
    Name = var.subnet_group_name
  }
}