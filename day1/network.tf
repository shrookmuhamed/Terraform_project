module "network" {
  source = "github.com/shrookmuhamed/Terraform_project//day1/network?ref=main"
  vpc_cidr=var.vpc_cidr
  pub_subnet_cidr=var.pub_subnet_cidr
  priv_subnet_cidr=var.priv_subnet_cidr
  priv_subnet2_cidr=var.priv_subnet2_cidr
}
