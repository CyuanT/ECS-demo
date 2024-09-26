module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  name = "ce7-ty-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.vpc_config["azs"]
  private_subnets = var.vpc_config["pri_subnets"]
  public_subnets  = var.vpc_config["pub_subnets"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = var.def_tags
}

resource "aws_vpc_endpoint" "s3-vpce" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Gateway"

  tags = {
    Name = var.s3_vpce
  }
}

resource "aws_security_group" "ty-sg" {

  name        = var.sg_name
  description = "ce7-ty-sg"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = var.sg_name
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1" # semantically equivalent to all ports
  }
}