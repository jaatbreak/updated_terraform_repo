

# VPC ID
variable "vpc_id" {
  description = "The ID of the VPC to deploy Neptune in"
  type        = string
 
}

# Subnet IDs for Neptune Subnet Group
variable "subnet_ids" {
  description = "List of subnet IDs for Neptune cluster"
  type        = list(string)
  
}

# Neptune Subnet Group Name
variable "neptune_subnet_group_name" {
  description = "Name of the Neptune subnet group"
  type        = string
 
}

# Neptune Cluster Identifier
variable "neptune_cluster_identifier" {
  description = "Identifier for the Neptune cluster"
  type        = string
  
}

# Neptune Parameter Group Name
variable "neptune_parameter_group_name" {
  description = "Name of the Neptune parameter group"
  type        = string
 
}

# Security Group Name for Neptune
variable "neptune_security_group_name" {
  description = "Name of the security group for Neptune"
  type        = string
 
}

# Allowed CIDR blocks for Neptune access
variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks for access to Neptune cluster"
  type        = list(string)
                                      # Replace with your actual VPC CIDR
}

# Instance count for Neptune cluster
variable "instance_count" {
  description = "Number of Neptune instances (primary and replicas)"
  type        = number
 
}

# Neptune instance class
variable "instance_class" {
  description = "Instance class for Neptune instances"
  type        = string
 
}

# Backup Retention Period (days)
variable "backup_retention_period" {
  description = "The number of days to retain backups"
  type        = number
 
}

# Preferred Backup Window
variable "preferred_backup_window" {
  description = "Preferred backup window"
  type        = string

}

# Preferred Maintenance Window
variable "preferred_maintenance_window" {
  description = "Preferred maintenance window"
  type        = string
 
}