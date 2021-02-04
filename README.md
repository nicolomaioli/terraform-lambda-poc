# terraform-lambda-poc

A basic example using
[terraform-aws-modules/lambda](https://registry.terraform.io/modules/terraform-aws-modules/lambda/aws/latest)
to deploy a Node.js Lambda built in Docker.

Create the following S3 buckets in AWS:

- `terraform-lambda-poc`
- `terraform-lambda-poc-deployment`

Create a `backend.tfvars` file with the content:

```
bucket = "terraform-lambda-poc"
region = "eu-west-1"
key    = "state"
```

Finally run:

```sh
terraform init -backend-configure=backend.tfvars
terraform plan -out plan.o
terraform apply plan.o
```
