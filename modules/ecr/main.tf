#ECR Respository private 
resource "aws_ecr_repository" "my_private_repo" {
  name = var.ecr_name

  tags = {
    Name        = "my-private-repo"
    Environment = "staging"  # Change as needed
  }
}
