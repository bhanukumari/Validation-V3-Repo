output "vpc_id" {
  value = module.network_skeleton.vpc_id
  description = "The id of the VPC"
}
output "public_subnet_ids" {
  value = module.network_skeleton.public_subnet_ids
  description = "value"
}

output "pvt_subnet_ids" {
  value = module.network_skeleton.pvt_subnet_ids
}
