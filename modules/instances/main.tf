# ---------------------------------------------------------
# EC2 Instace Config
# ---------------------------------------------------------
resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.INSTANCE_TYPE
  key_name      = aws_key_pair.mykeypair.key_name
  subnet_id     = element(var.PUBLIC_SUBNETS, 0)
  tags = {
    Environmnent = var.ENV
    Name         = "instance-${var.ENV}"
  }
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
}

# ---------------------------------------------------------
# AMI Config
# ---------------------------------------------------------
data "aws_ami" "ubuntu" {
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  most_recent = true
  owners      = ["099720109477"]
}

# ---------------------------------------------------------
# Security Group Config
# ---------------------------------------------------------
resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh-${var.ENV}"
  description = "security group that allows ssh and all egress traffic"
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  tags = {
    Environmnent = var.ENV
    Name         = "allow-ssh"
  }
  vpc_id = var.VPC_ID
}

# ---------------------------------------------------------
# EC2 key pair
# ---------------------------------------------------------
resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair-${var.ENV}"
  public_key = file("${path.root}/${var.PATH_TO_PUBLIC_KEY}")
}
