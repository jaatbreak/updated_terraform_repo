terraform {
  backend "s3" {
    bucket = "terraform-project-tf"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true

    
  }
}