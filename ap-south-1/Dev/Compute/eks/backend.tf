terraform {
  backend "s3" {
    bucket         = "nimbuspost-tf-state"
    key            = "env/dev/compute/eks.tfstate"
    region         = "ap-south-1"
    #dynamodb_table = "terraform-state-locking"
  }
}
