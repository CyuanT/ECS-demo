/*
variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0b72821e2f351e396"
}

variable "ec2_name" {
  description = "Name of EC2"
  type        = string
  default     = "TY-sample-ec2-tf" # Change accordingly
}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}
*/
# variable "key_name" {
#   description = "Name of EC2 Key Pair"
#   type        = string
#   default     = "Niu-TY-USeast1-20240713" # Change accordingly
# }

/*

variable "tf_subnet_region01" {
  description = "Region 1 of selected subnet"
  type        = string
  default     = "us-east-1a"
}

variable "tf_subnet_region02" {
  description = "Region 1 of selected subnet"
  type        = string
  default     = "us-east-1b"
}
*/
variable "s3_vpce" {
  description = "name of vpce for S3"
  type        = string
  default     = "TanYuan-tf-vpce-s3"
}

variable "sg_name" {
  description = "Name of Terraform EC2 security group"
  type        = string
  default     = "ce7-ty-sg"
}
/*
variable "tf_ec2_name" {
  description = "Name of EC2"
  type        = string
  default     = "TanYuan-tf-ec2" # Change accordingly
}

variable "pub_key_path" {
  description = "Name of EC2"
  type        = string
  default     = "~/.ssh/id_ed25519.pub" # Change accordingly
}


#referenced from https://stackoverflow.com/questions/49743220/how-to-create-an-ssh-key-in-terraform
variable "ec2_tf_key_name" {
  description = "Name of EC2"
  type        = string
  default     = "tf_ec2_key" # Change accordingly
}
*/

# Referenced from https://terrateam.io/blog/terraform-types/
variable "vpc_config" {
  description = "vpc config"
  type = object({
    azs         = list(string),
    pri_subnets = list(string),
    pub_subnets = list(string)
  })

  default = {
    "azs"         = ["us-east-1a", "us-east-1b"],
    "pri_subnets" = ["10.0.1.0/24", "10.0.2.0/24"],
    "pub_subnets" = ["10.0.101.0/24", "10.0.102.0/24"]
  }
}
variable "ami_id" {
  description = "EC2 ami id"
  type        = string
  default     = "ami-0ebfd941bbafe70c6"
}

variable "ecs_clusr_conf" {
  description = "ecs cluster configurations"
  type = object({
    cluster_name   = string,
    container_name = string,
    container_port = number,
    ecs_serv_name  = string,
    alb_name       = string,
    autoscale_name = string,
    autoscale_sg   = string
  })

  default = {
    "cluster_name"   = "ce7-ty-ecs",
    "container_name" = "ce7-ty-container",
    "container_port" = 80,
    "ecs_serv_name"  = "ce7-ty-ecs-serv",
    "alb_name"       = "ce-ty-alb",
    "autoscale_name" = "ce7-ty-autoscale",
    "autoscale_sg"   = "ce7-ty-auto-sg"
  }
}

variable "def_tags" {
  description = "default tags"
  type = object({
    creator     = string,
    environment = string
  })
  default = {
    "creator"     = "ce7-ty",
    "environment" = "dev"
  }
}