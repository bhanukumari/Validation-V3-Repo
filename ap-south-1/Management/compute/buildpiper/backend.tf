terraform {
  backend "s3" {
    bucket = "nimbuspost-tf-state"
    key    = "env/mgmt/compute/buildpiper/buildpiper-ec2.tfstate"
    region = "ap-south-1"
  }
}

