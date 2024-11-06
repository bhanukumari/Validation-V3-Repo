region               = "ap-south-1"
key_name             = "mgmt"
instance_count       = 1
ami_id               = "ami-09b0a86a2c84101e1"
instance_type        = "c6a.2xlarge"
public_ip            = false
volume_size          = 200
volume_type          = "gp3"
encrypted_volume     = false
iam_instance_profile = "BPEC2ADMINACCESS"
ec2_name             = "nimbuspost-mgmt-Buildpiper"
sg_name              = "nimbuspost-mgmt-Buildpiper-SG"

