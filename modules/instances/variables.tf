variable "ENV" {
  default     = "stage"
  description = "Project environment (env|stage|prod)"
}

variable "INSTANCE_TYPE" {
  default     = "t2.micro"
  description = "EC2 instance type"
}

variable "PATH_TO_PUBLIC_KEY" {
  default     = "mykey.pub"
  description = "A public security credenttial needed to communicate with AWS"
}

variable "PUBLIC_SUBNETS" {
  default     = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
  description = "Public CIDR blocks for your availabilty zones where your EC2 instance will reside"
  type        = list
}

variable "VPC_ID" {
  description = "Required VPC id for your EC2 instance"
}
