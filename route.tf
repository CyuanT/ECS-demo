resource "aws_vpc_endpoint_route_table_association" "priv-s3" {
  count           = length(module.vpc.private_route_table_ids)
  route_table_id  = module.vpc.private_route_table_ids[count.index]
  vpc_endpoint_id = aws_vpc_endpoint.s3-vpce.id
}