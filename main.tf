


module "aws_acm_certificate" {
  source = "./modules/acm"
  domain_name                = var.domain_name
  subject_alternative_names  = var.subject_alternative_names
  certificate_arn = module.aws_acm_certificate.certificate_arn
}

module "iam" {
  source = "./modules/iam"
}
  
module "s3" {
  source = "./modules/s3"
}

module "ecr" {
  source = "./modules/ecr"
  ecr_name = var.ecr_name
}


module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = var.vpc_id

}

module "secret" {
  source = "./modules/secret"
  secret_name = var.secret_name
  django_private_key = var.django_private_key
  django_field_encryption_key = var.django_field_encryption_key
  saml_x509_certificate = var.saml_x509_certificate
  eve_user_access_key_id = var.eve_user_access_key_id
  eve_user_secret_access_key = var.eve_user_secret_access_key
  postgres_password = var.postgres_password
  ac_key = var.ac_key 
}

module "aws_db_instance" {
  source = "./modules/aws_rds"
  subnet_group_name = var.subnet_group_name_elastic
  subnet_ids = var.subnet_ids_elastic
  db_instance_name = var.db_instance_name
  username   = var.username
  instance_class = var.instance_class
  allocated_storage  = var.allocated_storage
  engine_version = var.engine_version_rds
  vpc_security_group_ids = [module.security_groups.postgres_sg_id]
  secret_arn  = module.secret.secret_arn
}

module "aws_elasticache_cluster" {
  source = "./modules/aws_cache"
  cluster_name  = var.cluster_name
  node_type  = var.node_type
  engine_version  = var.engine_version_elastic_cache
  parameter_group_name  = var.parameter_group_name
  num_cache_nodes  = var.num_cache_nodes
  port  = var.port
  subnet_group_name = var.subnet_group_name
  auto_failover  = var.auto_failover
  transit_encryption_enabled  = var.transit_encryption_enabled
  at_rest_encryption_enabled  = var.at_rest_encryption_enabled
  subnet_ids  = var.subnet_ids
  vpc_security_group_ids = [module.security_groups.redis_sg_id]
  
}


module "zappa_lambda" {
  source = "./modules/zappa_lambda"
  s3_bucket = module.s3.s3_bucket_ids[0].bucket
  lambda_function_name = var.lambda_function_name
  lambda_s3_key  = var.lambda_s3_key
  role_arn  = module.iam.iam_role_ids
  lambda_handler = var.lambda_handler
  lambda_runtime = var.lambda_runtime
  api_gateway_name = var.api_gateway_name
  domain = var.domain
  certificate_arn = module.aws_acm_certificate.certificate_arn
  subnet_ids  = var.subnet_ids_zappa
  dns_name = var.dns_name_zappa
  stage_name = var.stage_name
  security_group_ids = [ module.security_groups.postgres_sg_id, module.security_groups.redis_sg_id, module.security_groups.secrets_manager_sg_ids ]

}

module "aws_neptune_cluster_instance" {
   source = "./modules/aws_neptune"
   vpc_id = var.vpc_id_neptune
   subnet_ids = var.subnet_ids_neptune
   neptune_subnet_group_name = var.neptune_subnet_group_name
   neptune_cluster_identifier  = var.neptune_cluster_identifier
   neptune_parameter_group_name = var.neptune_parameter_group_name
   neptune_security_group_name = var.neptune_security_group_name
   allowed_cidr_blocks = var.allowed_cidr_blocks
   instance_count= var.instance_count_neptune
   instance_class = var.instance_class_neptune
   backup_retention_period = var.backup_retention_period
   preferred_backup_window = var.preferred_backup_window
   preferred_maintenance_window = var.preferred_maintenance_window
}
