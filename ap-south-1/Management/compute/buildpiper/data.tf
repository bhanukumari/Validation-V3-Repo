data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "nimbuspost-tf-state"
    key    = "env/mgmt/network-skeleton/network.tfstate"
    region = "ap-south-1"

  }
}

data "terraform_remote_state" "openvpn" {
  backend = "s3"
  config = {
    bucket = "nimbuspost-tf-state"
    key    = "env/mgmt/compute/openvpn/openvpn.tfstate"
    region = "ap-south-1"

  }
}
#data "terraform_remote_state" "mgmt-alb" {
 # backend = "s3"
 # config = {
#    bucket = "nimbuspost-tf-state"
 #   key = "ap-south-1/env/mgmt/mgmt-alb.tfstate"
 #   region = "ap-south-1"
 # }
#}
