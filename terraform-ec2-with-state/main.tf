terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-demo-bucket"
    key            = "ec2/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_key_pair" "demo_key" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "demo_sg" {
  name        = "terraform-demo-sg"
  description = "Allow SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TerraformDemoSG"
  }
}

resource "aws_instance" "demo_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.demo_key.key_name
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  user_data = file("userdata.sh")

  tags = {
    Name = "TerraformDemoEC2"
  }
}
