# # Generate Private key
# resource "tls_private_key" "gen_pri_key" {
#     algorithm = "RSA"
#     rsa_bits = 4096
# }

# # Generate Public key with Private key
# resource "aws_key_pair" "TanYuan-tf-ec2-key" {
#   key_name   = var.ec2_tf_key_name
#   public_key = tls_private_key.gen_pri_key.public_key_openssh
# }

# # Store 
# resource "local_file" "private_key" {
#     content = tls_private_key.gen_pri_key.private_key_pem
#     filename = "../../Certificates/${var.ec2_tf_key_name}.pem"
# }