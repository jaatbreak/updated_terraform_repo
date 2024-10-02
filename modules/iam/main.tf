# Create IAM Policy
resource "aws_iam_policy" "example_policy" {
  name        = "example_policy"
  description = "A test policy for Lambda execution with various AWS service permissions"
  
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Sid       = "LambdaPermissions"
        Effect    = "Allow"
        Action    = [
          "lambda:CreateFunction",
          "lambda:TagResource",
          "route53:GetHostedZone",
          "logs:*",
          "dynamodb:*",
          "cloudformation:DescribeStackResource",
          "sts:GetAccessKeyInfo",
          "lambda:GetFunctionConfiguration",
          "secretsmanager:GetRandomPassword",
          "sts:GetSessionToken",
          "events:ListRuleNamesByTarget",
          "events:ListRules",
          "cloudformation:UpdateStack",
          "events:RemoveTargets",
          "lambda:ListLayerVersions",
          "lambda:ListLayers",
          "lambda:DeleteFunction",
          "ec2:DescribeNetworkInterfacePermissions",
          "apigateway:GET",
          "lambda:GetAlias",
          "events:ListTargetsByRule",
          "cloudformation:ListStackResources",
          "sns:*",
          "events:DescribeRule",
          "lambda:InvokeFunction",
          "route53:ChangeResourceRecordSets",
          "ec2:DeleteNetworkInterface",
          "cloudformation:DescribeStacks",
          "ec2:CreateNetworkInterface",
          "lambda:UpdateFunctionCode",
          "ec2:DescribeSecurityGroupRules",
          "cloudformation:DeleteStack",
          "apigateway:POST",
          "ec2:DescribeSubnets",
          "secretsmanager:ListSecrets",
          "sts:GetFederationToken",
          "lambda:ListVersionsByFunction",
          "lambda:GetLayerVersion",
          "events:PutRule",
          "lambda:GetLayerVersionPolicy",
          "lambda:UntagResource",
          "apigateway:DELETE",
          "secretsmanager:GetSecretValue",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribeNetworkInterfaceAttribute",
          "apigateway:PATCH",
          "cloudfront:UpdateDistribution",
          "sts:GetServiceBearerToken",
          "apigateway:PUT",
          "s3:*",
          "lambda:GetFunction",
          "route53:ListHostedZones",
          "lambda:UpdateFunctionConfiguration",
          "ec2:DescribeSecurityGroups",
          "events:DeleteRule",
          "events:PutTargets",
          "lambda:AddPermission",
          "ec2:DescribeSecurityGroupReferences",
          "cloudformation:CreateStack",
          "ec2:DescribeVpcs",
          "ecr:*",
          "sts:GetCallerIdentity",
          "lambda:DeleteFunctionConcurrency",
          "lambda:RemovePermission",
          "lambda:GetPolicy",
          "elasticfilesystem:ClientMount",
          "elasticfilesystem:ClientWrite",
          "elasticfilesystem:DescribeFileSystems",
          "elasticfilesystem:DescribeMountTargets"
        ]
        Resource  = "*"
      },
      {
        Sid       = "SecretAndRoleManagement"
        Effect    = "Allow"
        Action    = [
          "iam:GetRole",
          "iam:PassRole",
          "secretsmanager:GetResourcePolicy",
          "secretsmanager:UntagResource",
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
          "iam:CreateRole",
          "iam:AttachRolePolicy",
          "iam:PutRolePolicy",
          "secretsmanager:ListSecretVersionIds",
          "secretsmanager:TagResource"
        ]
        Resource  = [
          "arn:aws:secretsmanager:*:443370702909:secret:*",
          "arn:aws:iam::443370702909:role/flerken-qa-role"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "iam_role" {
  name = "ferklin_lambda_ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "lambda.amazonaws.com",  # Allow Lambda to assume the role
            "ec2.amazonaws.com"      # Allow EC2 to assume the role
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the policy to the IAM Role
resource "aws_iam_role_policy_attachment" "role_attach" {
  role       =  aws_iam_role.iam_role.id # Ensure this matches the role name
  policy_arn = aws_iam_policy.example_policy.arn
}