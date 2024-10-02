variable "cluster_name" {
  description = "The name of the ElastiCache Redis cluster"
  type        = string
 
}

variable "node_type" {
  description = "The instance type for the ElastiCache Redis nodes"
  type        = string

}

variable "engine_version" {
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

variable "subnet_group_name" {
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
  default     = false
}

variable "subnet_ids" {
    description = "subnet-group"
    type = list(string)
   
  
}

variable "vpc_security_group_ids" {
  description = "define the security group string"
  type = list(string)
}