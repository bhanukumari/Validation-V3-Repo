
region="ap-south-1"
cidr_block="10.51.0.0/16"
vpc_name="nimbuspost-mgmt-vpc"
igw_name="nimbuspost-mgmt-igw"
public_subnets_cidr=["10.51.0.0/24","10.51.1.0/24"]
private_subnets_cidr=["10.51.4.0/22","10.51.8.0/22"]
avaialability_zones=["ap-south-1a","ap-south-1b"]
pub_rt_name="nimbuspost-mgmt-pub"
pub_subnet_name="nimbuspost-mgmt-pub-sub"
nat_name="nimbuspost-mgmt-nat"
pvt_rt_name="nimbuspost-mgmt-pvt"
pvt_subnet_name="nimbuspost-mgmt-pvt-sub"
enable_igw_publicRouteTable_PublicSubnets_resource=true
enable_nat_privateRouteTable_PrivateSubnets_resource=true
tags={
     "owner" = "devops"
     "env"   = "mgmt"
     "managed-by" = "terraform"
     "vertical"   = "nimbuspost"
}
