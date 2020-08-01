module "main-vpc" {
  source = "../modules/vpc"

  AWS_REGION      = var.AWS_REGION
  CIDR            = var.CIDR
  ENV             = var.ENV
  PUBLIC_SUBNETS  = var.PUBLIC_SUBNETS
  PRIVATE_SUBNETS = var.PRIVATE_SUBNETS
}

module "instances" {
  source = "../modules/instances"

  ENV            = var.ENV
  PUBLIC_SUBNETS = module.main-vpc.public_subnets
  VPC_ID         = module.main-vpc.vpc_id
}
