module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "terraform-lambda-poc"
  description   = "POC to explore different ways of building Node.js lambdas in tf"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  publish       = true

  build_in_docker = true
  docker_file     = "${path.module}/Dockerfile"

  source_path = [
    {
      path = "${path.module}/lambda"
      commands = [
        "npm ci --only=prod",
        ":zip ."
      ]
    }
  ]

  store_on_s3 = true
  s3_bucket   = "terraform-lambda-poc-deployment"

  environment_variables = {
    BASE_URL = "https://swapi.dev/api/people"
  }

  tags = {
    Terraform   = "true"
    Application = "terraform-lambda-poc"
  }
}
