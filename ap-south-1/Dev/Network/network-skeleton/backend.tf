terraform {
  backend "s3" {
    bucket         = "nimbuspost-tf-state"
    key            = "env/dev/network-skeleton/network.tfstate"
    region         = "ap-south-1"
  # dynamodb_table = "terraform-state-locking"

  }
}
