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

resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.INSTANCE_TYPE
  key_name      = aws_key_pair.mykeypair.key_name
  subnet_id     = element(var.PUBLIC_SUBNETS, 0)
  tags = {
    Name         = "instance-${var.ENV}"
    Environmnent = var.ENV
  }
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
}

resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh-${var.ENV}"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name         = "allow-ssh"
    Environmnent = var.ENV
  }
  vpc_id = var.VPC_ID
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair-${var.ENV}"
  public_key = file("${path.root}/${var.PATH_TO_PUBLIC_KEY}")
}
