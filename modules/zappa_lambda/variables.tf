variable "s3_bucket" {
  description = "S3 bucket for Zappa deployment"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_s3_key" {
  description = "The key in the S3 bucket where the Lambda function code is stored"
  type        = string
}

variable "role_arn" {
  description = "The ARN of the IAM role for Lambda"
  type        = string
}

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

variable "dns_name" {
  description = "The custom DNS name for API Gateway"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the SSL certificate for the custom domain"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for Lambda VPC configuration"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for Lambda VPC configuration"
  type        = list(string)
}

variable "lambda_version" {
  description = "Lambda function version (optional, for Lambda aliases)"
  type        = string
  default     = "1"
}

variable "stage_name" {
  description = "Stage name for API Gateway deployment"
  type        = string
  default     = "live"
}

variable "domain" {
    description = "define dns "  
    type = string
}