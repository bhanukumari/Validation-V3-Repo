provider "aws" {
  region = var.region
  default_tags {
    tags = {
      "owner"      = "devops"
      "env"        = "dev"
      "managed-by" = "terraform"
      "vertical"   = "nimbuspost"
    }

  }
}
