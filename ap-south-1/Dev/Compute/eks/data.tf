data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "nimbuspost-tf-state"
    key    = "env/dev/network-skeleton/network.tfstate"
    region = "ap-south-1"
  }
}
