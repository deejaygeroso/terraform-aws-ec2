module "main-vpc" {
  AWS_REGION = var.AWS_REGION
  ENV        = "dev"

  source = "../modules/vpc"
}

module "instances" {
  ENV            = "dev"
  PUBLIC_SUBNETS = module.main-vpc.public_subnets
  VPC_ID         = module.main-vpc.vpc_id

  source = "../modules/instances"
}
