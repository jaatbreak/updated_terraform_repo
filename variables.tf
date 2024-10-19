
//ACM Certificate
variable "region" {
  description = "Define the AWS region"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "The domain name for which to request the ACM certificate"
  type        = string
}

variable "subject_alternative_names" {
  description = "Optional alternative domain names for the certificate"
  type        = list(string)
  default     = []
}

variable "certificate_arn" {
  description = "The ARN of the certificate, for output purposes"
  type        = string
  default     = ""
}

// ecr repo name
variable "ecr_name" {
    description = "ecr_name"
    type = string
  
}

// define vpc id
variable "vpc_id" {
    description = "define the vpc id"
    type = string
   
}
/// secrets variables 
variable "secret_name" {
  description = "The name of the secret in AWS Secrets Manager"
 
}

# variable "django_private_key" {
#   description = "Private key for Django"
  
# }

# variable "django_field_encryption_key" {
#   description = "Field encryption key for Django"

# }

# variable "saml_x509_certificate" {
#   description = "X509 Certificate for SAML"
  
# }

# variable "eve_user_access_key_id" {
#   description = "Access key ID for EVE user"
 
# }

# variable "eve_user_secret_access_key" {
#   description = "Secret access key for EVE user"
 
# }

# variable "postgres_password" {
#   description = "Password for PostgreSQL"
 
# }

# variable "ac_key" {
#   description = "Access key for AC"
 
# }

// aws rds 

# Subnet Group Name
variable "subnet_group_name_rds" {
  description = "Name of the RDS subnet group."

}

# Subnet IDs
variable "subnet_ids" {
  description = "List of subnet IDs to associate with the RDS instance."
  type        = list(string)
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
variable "engine_version_rds" {
  description = "The version of PostgreSQL to use."

}

variable "secret_arn" {
  description = "fetch the secret arn"
  
}

// AWS Cache

variable "cluster_name" {
  description = "The name of the ElastiCache Redis cluster"
  type        = string
 
}

variable "node_type" {
  description = "The instance type for the ElastiCache Redis nodes"
  type        = string

}

variable "engine_version_elastic_cache" {
  description = "Redis engine version"
  type        = string
 
}

variable "parameter_group_name" {
  description = "Name of the Redis parameter group"
  type        = string
 
}

variable "num_cache_nodes" {
  description = "Number of cache nodes in the Redis cluster"
  type        = number

}

variable "port" {
  description = "Port number on which Redis will be available"
  type        = number
  
}

variable "subnet_group_name_elastic" {
  description = "The name of the cache subnet group"
  type        = string

}



variable "auto_failover" {
  description = "Whether to enable Multi-AZ with automatic failover"
  type        = bool
  
}

variable "transit_encryption_enabled" {
  description = "Enable in-transit encryption for Redis"
  type        = bool

}

variable "at_rest_encryption_enabled" {
  description = "Enable encryption at rest for Redis"
  type        = bool
 
}

variable "subnet_ids_cache" {
    description = "subnet-group"
    type = list(string) 
}

/// Zappa Lambda variablesa

# variable "s3_bucket" {
#   description = "S3 bucket for Zappa deployment"
#   type        = string
# }

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_s3_key" {
  description = "The key in the S3 bucket where the Lambda function code is stored"
  type        = string
}

# variable "role_arn" {
#   description = "The ARN of the IAM role for Lambda"
#   type        = string
# }

variable "lambda_handler" {
  description = "The handler for the Lambda function (e.g., 'app.lambda_handler')"
  type        = string
}

variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function (e.g., 'python3.8')"
  type        = string
}

variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "dns_name_zappa" {
  description = "The custom DNS name for API Gateway"
  type        = string
}

# variable "certificate_arn_zappa" {
#   description = "The ARN of the SSL certificate for the custom domain"
#   type        = string
# }

variable "subnet_ids_zappa" {
  description = "List of subnet IDs for Lambda VPC configuration"
  type        = list(string)
}

# variable "security_group_ids" {
#   description = "List of security group IDs for Lambda VPC configuration"
#   type        = list(string)
# }

variable "lambda_version" {
  description = "Lambda function version (optional, for Lambda aliases)"
  type        = string
  default     = "1"
}

variable "domain" {
  description = "The custom domain for API Gateway"
  type        = string

}

variable "stage_name" {
  description = "Stage name for API Gateway deployment"
  type        = string
  default     = "live"
}


// AWS Neptune Cluster Variables

# VPC ID
variable "vpc_id_neptune" {
  description = "The ID of the VPC to deploy Neptune in"
  type        = string
 
}

# Subnet IDs for Neptune Subnet Group
variable "subnet_ids_neptune" {
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
variable "instance_count_neptune" {
  description = "Number of Neptune instances (primary and replicas)"
  type        = number
 
}

# Neptune instance class
variable "instance_class_neptune" {
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