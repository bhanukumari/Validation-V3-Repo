terraform {
  backend "s3" {
    bucket = "nimbuspost-tf-state"
    key    = "ap-south-1/env/mgmt/mgmt-alb.tfstate"
    region = "ap-south-1"
  }
}

