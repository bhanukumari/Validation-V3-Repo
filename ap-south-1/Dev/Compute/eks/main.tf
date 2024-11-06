locals {
  common_tags                   = {"k8s.io/cluster-autoscaler/enabled": true}
  worker_group1_tags            = { "Name" : "app-NG" }
  cluster_endpoint_access_cidrs = ["10.51.6.160/32"]
  vpc_id                        = data.terraform_remote_state.network.outputs.vpc_id
  subnet_ids                    = [data.terraform_remote_state.network.outputs.app_subnet_ids[0][0], data.terraform_remote_state.network.outputs.app_subnet_ids[0][1]]
  w1_subnet_ids                 = [data.terraform_remote_state.network.outputs.app_subnet_ids[0][0], data.terraform_remote_state.network.outputs.app_subnet_ids[0][1]]
}
module "eks_internal_ssh_security_group" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source                             = "OT-CLOUD-KIT/security-groups/aws"
  version                            = "1.0.0"
  enable_whitelist_ip                = true
  enable_source_security_group_entry = true
  name_sg                            = var.eks_node_sg_name
  vpc_id                             = local.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "22 port for mgmt vpn private ip "
          from_port    = 22
          to_port      = 22
          protocol     = "tcp"
          cidr         = ["10.51.0.18/32"]
          ipv6_cidr    = []
          source_SG_ID = []
        }
      ]
    }
  }
}

module "prod_eks_cluster" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source                        = "OT-CLOUD-KIT/eks/aws"
  version                       = "1.1.0"
  cluster_name                  = var.cluster_name
  eks_cluster_version           = var.eks_cluster_version
  subnets                       = local.subnet_ids
  tags                          = local.common_tags
  kubeconfig_name               = "config"
  config_output_path            = "config"
  eks_node_group_name           = var.eks_node_group_name
  region                        = var.region
  cluster_endpoint_whitelist    = true
  cluster_endpoint_access_cidrs = local.cluster_endpoint_access_cidrs
  create_node_group             = true
  endpoint_private              = true
  endpoint_public               = false
  k8s-spot-termination-handler  = false
  
  cluster_autoscaler            = false
  metrics_server                = false
  vpc_id                        = local.vpc_id
  node_groups = {
    "app-NG" = {
      subnets            = local.w1_subnet_ids
      ssh_key            = var.ssh_key
      security_group_ids = [module.eks_internal_ssh_security_group.sg_id]
      instance_type      = var.w1_instance_type
      ami_type           = var.ami_type
      desired_capacity   = var.w1_desired_capacity
      disk_size          = var.w1_disk_size
      max_capacity       = var.w1_max_capacity
      min_capacity       = var.w1_min_capacity
      capacity_type      = var.w1_capacity_type
      tags               = merge(local.common_tags, local.worker_group1_tags)
      labels             = { "TYPE" : "SPOT", "node_group" : "Stateless", "PROJECT" : "BUILDPIPER"}
    }
  }
}
