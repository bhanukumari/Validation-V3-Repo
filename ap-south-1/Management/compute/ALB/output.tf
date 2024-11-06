output "mgmt_alb_sg_id" {
  description = "SG IDs of the EC2 instances"
  value       = module.public_alb_security_group.sg_id
}

output "mgmt_alb_dns" {
  description = "SG IDs of the EC2 instances"
  value       = module.public_alb.alb_dns_name
}