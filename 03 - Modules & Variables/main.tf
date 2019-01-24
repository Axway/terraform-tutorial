terraform {
  required_version = ">= 0.10.6"
  backend "s3" {
    bucket = "condor-terraform-tutorial"
    key = "terraform.tfstate"
    workspace_key_prefix = "terraform-states"
    encrypt = "true"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "foundation" {
  source = "foundation"
  project = "${var.project}"
  platform = "${terraform.workspace}"
  team = "${var.team}"
  ami = "ami-7cbc6e13"
}
