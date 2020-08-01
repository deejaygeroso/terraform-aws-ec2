module "main-vpc" {
  source = "../modules/vpc"

  AWS_REGION = var.AWS_REGION
  ENV        = "dev"
}

module "instances" {
  source = "../modules/instances"

  ENV            = "dev"
  PUBLIC_SUBNETS = module.main-vpc.public_subnets
  VPC_ID         = module.main-vpc.vpc_id
}
