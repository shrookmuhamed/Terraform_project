module "network" {
  source = "/home/shrouk/Documents/ITI/terraform/network"
  vpc_cidr=var.vpc_cidr
  pub_subnet_cidr=var.pub_subnet_cidr
  priv_subnet_cidr=var.priv_subnet_cidr
  priv_subnet2_cidr=var.priv_subnet2_cidr
}