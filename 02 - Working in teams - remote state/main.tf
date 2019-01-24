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

resource "aws_instance" "bastion" {
  ami = "ami-0018f5be0ccc813c8"
  instance_type = "t2.micro"
  tags {
    Name = "first_instance"
    Project = "terraform-tutorial"
  }
}

output "instance_id" {
  value = "${aws_instance.bastion.id}"
}
