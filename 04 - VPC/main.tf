terraform {
  required_version = ">= 0.10.6"
  backend "s3" {
    bucket = "condor-terraform-tutorial"
    key = "terraform.tfstate"
    workspace_key_prefix = "terraform-states"
    encrypt = "true"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "foundation" {
  source = "foundation"
  project = "${var.project}"
  platform = "${terraform.workspace}"
  team = "${var.team}"
  ssh_public_key = "${var.ssh_public_key}"
  ami = "ami-7cbc6e13"
  cidr_blocks_allowed_to_ssh_bastion = "${var.my_ip_address}"
}
