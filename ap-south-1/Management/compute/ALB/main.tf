module "public_alb_security_group" {
  source  = "OT-CLOUD-KIT/security-groups/aws"
  version = "1.0.0"
  name_sg = "management-public-alb-sg"
  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  enable_whitelist_ip                 = true
  enable_source_security_group_entry  = true
  create_outbound_rule_with_src_sg_id = false
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "Rule for port 80 for mgmt vpn ip"
          from_port    = 80
          to_port      = 80
          protocol     = "tcp"
          cidr         = [var.ovpn_ip]
          source_SG_ID = []
        },
        {
          description  = "Rule for port 443 for mgmt vpn ip "
          from_port    = 443
          to_port      = 443
          protocol     = "tcp"
          cidr         = [var.ovpn_ip]
          source_SG_ID = []
        },
        {
          description  = "Rule for port 443 for Whitelisted IPs "
          from_port    = 443
          to_port      = 443
          protocol     = "tcp"
          cidr         = ["20.248.137.48/32","20.233.54.53/32","20.207.73.82/32","20.27.177.113/32","20.205.243.166/32","20.201.28.151/32","20.87.225.212/32","192.30.252.0/22","20.200.245.247/32","143.55.64.0/20","185.199.108.0/22","140.82.112.0/20"]
          source_SG_ID = []
        },
        {
          description  = "Rule for port 80 for Whitelisted IPs "
          from_port    = 80
          to_port      = 80
          protocol     = "tcp"
          cidr         = ["20.248.137.48/32","20.233.54.53/32","20.207.73.82/32","20.27.177.113/32","20.205.243.166/32","20.201.28.151/32","20.87.225.212/32","192.30.252.0/22","20.200.245.247/32","143.55.64.0/20","185.199.108.0/22","140.82.112.0/20"]
          source_SG_ID = []
        },
        {
          description  = "Rule for port 443 for Whitelisted IPs "
          from_port    = 443
          to_port      = 443
          protocol     = "tcp"
          cidr         = []
          source_SG_ID = []
          ipv6_cidr = ["2606:50c0::/32","2a0a:a440::/29"]
        },
        {
          description  = "Rule for port 80 for Whitelisted IPs "
          from_port    = 80
          to_port      = 80
          protocol     = "tcp"
          cidr         = []
          source_SG_ID = []
          ipv6_cidr = ["2606:50c0::/32","2a0a:a440::/29"]
        }

      ]
    }
  }
}

module "public_alb" {
  source                     = "OT-CLOUD-KIT/alb/aws"
  version                    = "0.0.4"
  alb_name                   = var.alb_name
  internal                   = false
  security_groups_id         = [module.public_alb_security_group.sg_id]
  subnets_id                 = [data.terraform_remote_state.network.outputs.public_subnet_ids[0][0], data.terraform_remote_state.network.outputs.public_subnet_ids[0][1]]
  logs_bucket                = var.logs_bucket
  enable_logging             = var.enable_logging
  enable_deletion_protection = var.enable_deletion_protection
  tags                       = var.tags
  alb_certificate_arn        = var.alb_certificate_arn
}