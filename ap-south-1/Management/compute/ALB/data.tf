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
data "terraform_remote_state" "buildpiper" {
  backend = "s3"
  config = {
    bucket = "nimbuspost-tf-state"
    key    = "env/mgmt/compute/buildpiper/buildpiper-ec2.tfstate"
    region = "ap-south-1"

  }
}
