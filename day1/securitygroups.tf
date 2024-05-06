resource "aws_security_group" "ssh_sg" {
  name        = "ssh_anywhere"
  description = "Allow SSH from anywhere"
  vpc_id      = module.network.myvpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "sg1"
  }

}

resource "aws_security_group" "ssh-3000" {
  name        = "ssh_internal"
  description = "Allow SSH and port 3000 from VPC CIDR"
  vpc_id      = module.network.myvpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cidr]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cidr]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "sg2"
  }
}
resource "aws_security_group" "redis_sec_group" {
  name        = "redis_sec_group"
  description = "Allow port 6379"
  vpc_id      = module.network.myvpc_id

  ingress {
    description = "6379 ingress"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "6379 ingress"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}