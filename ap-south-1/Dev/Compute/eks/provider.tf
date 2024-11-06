provider "aws" {
  region = var.region
  default_tags {
    tags = {
      "owner"      = "devops"
      "env"        = "qa"
      "managed-by" = "terraform"
      "vertical"   = "nimbuspost"
    }

  }
}
