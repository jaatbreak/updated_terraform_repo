# Generate random string
resource "random_string" "unique_id" {
  length  = 6
  special = false
  upper   = false
}

# Create S3 bucket with unique name
resource "aws_s3_bucket" "bucket_create" {
  bucket = "flerken-zappa-qa-${random_string.unique_id.result}"
}

# resource "null_resource" "upload_lambda_zip" {
#   provisioner "local-exec" {
#     # Ensure Windows paths are escaped correctly with double backslashes
#     command = "aws s3 cp \"C:\\Users\\RITS\\Downloads\\terrafrom_project\\lambda_function.zip\" s3://${aws_s3_bucket.bucket_create.bucket}/lambda_function.zip"
#   }

#   # Ensures the bucket is created before the file is uploaded
#   depends_on = [aws_s3_bucket.bucket_create]
# }


# Create folders in S3 bucket
resource "aws_s3_object" "folder_create_graph" {
  bucket = aws_s3_bucket.bucket_create.bucket
  key    = "graph/"
  acl    = "private"
}

resource "aws_s3_object" "folder_create_csv" {
  bucket = aws_s3_bucket.bucket_create.bucket
  key    = "csv/"
  acl    = "private"
}