module "new-vpc" {
  source = "./modules/vpc"
  prefix = var.prefix
  count-subnets = var.count-subnets
  vpc_cidr_block = var.vpc_cidr_block
}

module "eks" {
  source = "./modules/eks"
  prefix = var.prefix
  cluster_name = var.cluster_name
  
  vpc_id = module.new-vpc.vpc_id
  subnet_ids = module.new-vpc.subnet_ids
  
  retention_in_days = var.retention_in_days
  desired_size = var.desired_size
  max_size = var.max_size
  min_size = var.min_size
}