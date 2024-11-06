provider "aws" {
  region = var.region
  default_tags {
    tags = {
      "owner"      = "devops"
      "env"        = "mgmt"
      "managed-by" = "terraform"
      "vertical"   = "nimbuspost"
    }
  }
}
