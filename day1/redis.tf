# Creating subnet group
resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "subnet-group-2"
  subnet_ids = [module.network.priv_subnet_id]
    tags = {
    Name = "Redis subnet group"
  }
}

# Create the ElastiCache cluster
resource "aws_elasticache_cluster" "redis_cluster_1" {
  cluster_id           = "cluster-redis"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  engine_version       = "7.1"
  port                 = 6379
  security_group_ids = [aws_security_group.redis_sec_group.id]
}