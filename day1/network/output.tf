output myvpc_id {
  value = aws_vpc.vpc1.id

}
output vpc_cidr {
  value = aws_vpc.vpc1.cidr_block

}
output pub_subnet_id {
  value = aws_subnet.pubsubnet1.id

}
output pub_subnet2_id {
  value = aws_subnet.pubsubnet2.id

}
output  priv_subnet_id {
  value = aws_subnet.privsubnet1.id

}
output  priv_subnet2_id {
  value = aws_subnet.privsubnet2.id

}