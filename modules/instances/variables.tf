variable "ENV" {
  default     = "stage"
  description = "Project environment (env|stage|prod)"
}

variable "INSTANCE_TYPE" {
  default     = "t2.micro"
  description = "EC2 instance type"
}

variable "PUBLIC_SUBNETS" {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "Public CIDR blocks for your availabilty zones. Values should the same with the VPC public subnets"
  type        = list
}

variable "RSA_KEY_FILENAME" {
  default     = "mykey"
  description = "Filename of RSA key"
}

variable "VPC_ID" {
  description = "Required VPC id for your EC2 instance"
}
