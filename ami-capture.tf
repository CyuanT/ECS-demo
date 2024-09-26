/*
data "aws_ami" "ama_tf_image" {
  executable_users = ["self"]
  most_recent      = false
  name_regex       = "^myami-\\d{3}"
  owners           = ["self"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "description"
    values = ["Amazon Linux 2023 AMI*"]
  }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
}

output "images" {
    value = data.aws_ami.ama_tf_image.id
    sensitive = true
}
*/