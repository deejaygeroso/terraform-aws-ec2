# ---------------------------------------------------------
# VPC Config
# ---------------------------------------------------------
module "main-vpc" {
  source = "../modules/vpc"

  AWS_REGION      = var.AWS_REGION
  CIDR            = var.CIDR
  ENV             = var.ENV
  PRIVATE_SUBNETS = var.PRIVATE_SUBNETS
  PUBLIC_SUBNETS  = var.PUBLIC_SUBNETS
}

# ---------------------------------------------------------
# EC2 Instance Config
# ---------------------------------------------------------
module "instances" {
  source = "../modules/instances"

  ENV            = var.ENV
  PUBLIC_SUBNETS = module.main-vpc.public_subnets
  VPC_ID         = module.main-vpc.vpc_id
}
