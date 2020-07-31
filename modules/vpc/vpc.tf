module "vpc" {
  azs                = ["${var.AWS_REGION}a", "${var.AWS_REGION}b", "${var.AWS_REGION}c"]
  cidr               = "10.0.0.0/16"
  enable_nat_gateway = false
  enable_vpn_gateway = false
  name               = "vpc-${var.ENV}"
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  source             = "terraform-aws-modules/vpc/aws"
  tags = {
    Environment = var.ENV
    Terraform   = "true"
  }
}
