# API Gateway and Lambda function configuration (Zappa)
resource "aws_lambda_function" "zappa_lambda" {
  function_name = var.lambda_function_name
  s3_bucket     = var.s3_bucket
  s3_key        = var.lambda_s3_key
  role          = var.role_arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
}

# Attach API Gateway to Lambda (API Gateway Enabled)
resource "aws_api_gateway_rest_api" "zappa_api" {
  name        = var.api_gateway_name
  description = "API Gateway for Zappa Lambda"
}

resource "aws_api_gateway_resource" "zappa_resource" {
  rest_api_id = aws_api_gateway_rest_api.zappa_api.id
  parent_id   = aws_api_gateway_rest_api.zappa_api.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "zappa_method" {
  rest_api_id   = aws_api_gateway_rest_api.zappa_api.id
  resource_id   = aws_api_gateway_resource.zappa_resource.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "zappa_integration" {
  rest_api_id             = aws_api_gateway_rest_api.zappa_api.id
  resource_id             = aws_api_gateway_resource.zappa_resource.id
  http_method             = aws_api_gateway_method.zappa_method.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = aws_lambda_function.zappa_lambda.invoke_arn
}

# Add Lambda invoke permission for API Gateway
resource "aws_lambda_permission" "api_gateway_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.zappa_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # Allow API Gateway REST API to invoke the Lambda function
  source_arn = "${aws_api_gateway_rest_api.zappa_api.execution_arn}/*/*"
}

resource "aws_api_gateway_domain_name" "zappa_custom_domain" {
  domain_name     = var.dns_name
  certificate_arn = var.certificate_arn  # Use the correct ACM certificate for the region

  endpoint_configuration {
    types = ["EDGE"]  # Change from EDGE to REGIONAL if needed
  }
}

resource "aws_api_gateway_base_path_mapping" "zappa_base_path_mapping" {
  api_id      = aws_api_gateway_rest_api.zappa_api.id
  stage_name  = aws_api_gateway_deployment.zappa_deployment.stage_name
  domain_name = aws_api_gateway_domain_name.zappa_custom_domain.domain_name
}

# Lambda function deployment
resource "aws_lambda_alias" "zappa_alias" {
  name             = "live"
  function_name    = aws_lambda_function.zappa_lambda.function_name
  function_version = aws_lambda_function.zappa_lambda.version
}

resource "aws_api_gateway_deployment" "zappa_deployment" {
  depends_on  = [aws_api_gateway_integration.zappa_integration]
  rest_api_id = aws_api_gateway_rest_api.zappa_api.id
  stage_name  = "live"
}

output "api_url" {
  value = aws_api_gateway_rest_api.zappa_api.execution_arn
}
