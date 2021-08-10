terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.32"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_dynamodb_table" "table"{
    name = "Dogs"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "Breed"
    attribute {
      name = "Breed"
      type = "S"
    }
}

resource "aws_iam_policy" "policy" {
  name = "dynamo_allow_read"
  description = "Dynamo DB read, write and delete"
  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "dynamodb: Scan",
                "dynamodb: BatchgetItem",
                "dynamodb: PutItem",
                "dynamodb: DescribeTable",
                "dynamodb: BatchWriteItem",
                "dynamodb: Query",
                "dynamodb: ConditionCheckItem",
                "dynamodb: GetItem",
                "dynamodb: DeleteItem",
                "dynamodb: UpdateItem"
            ],
            "Resource": "arn:aws:dynamodb:*:113313345969:table/Dogs"
        }
    ]
}
EOT
}