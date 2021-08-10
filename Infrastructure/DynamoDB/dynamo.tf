resource "aws_dynamodb_table" "table"{
    name = "Dogs"
    billing_mode = "Pay_Per_Request"
    hash_key = "Breed"
    attribute {
      name = "Breed"
      type = "S"
    }
}

resource "aws iam policy" "policy" {
  name = "dynamo_allow_read"
  description = "Dynamo DB read, write and delete"

  policy = <<EOT
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action":[
          "dynamodb: BatchgetItem",
          "dynamodb: BatchWriteItem",
          "dynamodb: ConditionCheckItem",
          "dynamodb: PutItem",
          "dynamodb: DescribeTable",
          "dynamodb: DeleteItem",
          "dynamodb: GetItem",
          "dynamodb: Scan",
          "dynamodb: Query",
          "dynamodb: UpdateItem",
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:dynamodb:*:113313345969:table/Dogs"
      },
    ]
  }
EOT
}