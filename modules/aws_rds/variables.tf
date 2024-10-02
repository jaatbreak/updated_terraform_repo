# AWS Region

# Subnet Group Name
variable "subnet_group_name" {
  description = "Name of the RDS subnet group."

}

# Subnet IDs
variable "subnet_ids" {
  description = "List of subnet IDs to associate with the RDS instance."
  type        = list(string)
#   default = [ "subnet-02d6dd2702885baad","subnet-0309a373acbbfcd38" ]
}


# DB Instance Name
variable "db_instance_name" {
  description = "Name of the RDS DB instance."
 
}

# DB Username
variable "username" {
  description = "Master username for the RDS instance."
 
}



# RDS Instance Class
variable "instance_class" {
  description = "The instance class for the RDS PostgreSQL instance."
 
}

# Allocated Storage
variable "allocated_storage" {
  description = "The allocated storage for the RDS instance (in GB)."

}

# PostgreSQL Engine Version
variable "engine_version" {
  description = "The version of PostgreSQL to use."

}

variable "vpc_security_group_ids" {
  description = "define the security group string"
  type = list(string)
}

variable "secret_arn" {
  description = "ARN of the secret in AWS Secrets Manager"
  type        = string
}