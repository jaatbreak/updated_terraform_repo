
// ACM Resources
domain_name                = "chanchaltech.in.net"
subject_alternative_names  = ["chanchaltech.in.net"]
region                     = "us-east-1"

/// ecr repo name
ecr_name =  "my_new_ecr_repo"

// vpc id  in security group 
vpc_id = "vpc-0a5d21b64177a9993"

// secret key or values 
 secret_name =  "secret-flerken-str"
  # django_private_key = "1e56c5e8-5833-4a1f-9cac-882795bc5b36"
  # django_field_encryption_key = "Fkk1r+h4o1EaRLy5MHTn26G3WfNfTcA8HvIRJ3Le"
  # saml_x509_certificate = "AKIA6B7Q34TURNS0AMQR"
  # eve_user_access_key_id = "JLu3XzkhC+Dt4VxH37Fh9FwPx3jg5tFnv3"
  # eve_user_secret_access_key = "AKIA6B7Q34TURNS0AMQR"
  #postgres_password = "5b4086c0-583f-43f1-9074-25704e9a8b97"
  # ac_key = "5adf03b1-56da-4cf2-8820-3cfeb59e4e57"


  ///AWS RDS
  subnet_group_name_rds = "my-rds-subnet-grp1"
  subnet_ids =   [ "subnet-02d6dd2702885baad","subnet-0309a373acbbfcd38" ]
  db_instance_name = "flrakin-rds-db"
  username   = "adminuser"
  instance_class = "db.t3.medium"
  allocated_storage  = 20
  engine_version_rds  = 16.3
  secret_arn = "arn:aws:secretsmanager:us-east-1:443370702909:secret:my_secrets-AJ0SCM"


// AWS elastic_cache 

 cluster_name  = "flerken-qa"
  node_type  = "cache.t3.micro"
  engine_version_elastic_cache  = 7.1
  parameter_group_name  = "default.redis7"
  num_cache_nodes  = 1
  port  = 6379
  subnet_group_name_elastic = "test-subnet-grp"
  auto_failover  = false
  transit_encryption_enabled  = true
  at_rest_encryption_enabled  = false
  subnet_ids_cache  =  [ "subnet-02d6dd2702885baad","subnet-0309a373acbbfcd38" ]

//AWS Zappa Lambda 
  lambda_function_name = "flask-lambda-function"
  lambda_s3_key  = "lambda_function.zip"
  lambda_handler = "lambda_function.lambda_handler"
  lambda_runtime = "python3.8"
  api_gateway_name = "test-api-gt"
  domain = "chanchaltech.in.net"
  subnet_ids_zappa  =  [ "subnet-02d6dd2702885baad","subnet-0309a373acbbfcd38" ]
  dns_name_zappa = "chanchaltech.in.net"


  // aws neptune cluster variables

   vpc_id_neptune = "vpc-0a5d21b64177a9993"
   subnet_ids_neptune =  [ "subnet-02d6dd2702885baad","subnet-0309a373acbbfcd38" ]
   neptune_subnet_group_name = "neptune-subnet-group"
   neptune_cluster_identifier  = "db-neptune-1"
   neptune_parameter_group_name = "neptune-cluster-parameter-group"
   neptune_security_group_name =  "neptune-security-group"
   allowed_cidr_blocks =  ["0.0.0.0/0"]
   instance_count_neptune= 1
   instance_class_neptune = "db.t3.medium"
   backup_retention_period = 5
   preferred_backup_window = "07:00-09:00"
   preferred_maintenance_window = "sun:23:00-mon:01:30"