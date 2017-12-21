terraform {
  required_version = ">= 0.10.6"
  backend "s3" {
    bucket = "axway-adi-terraform-tutorial"
    key = "terraform.tfstate"
    workspace_key_prefix = "terraform-states"
    encrypt = "true"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "bastion" {
  ami = "ami-7cbc6e13"
  instance_type = "t2.micro"
  tags {
    Name = "first_instance"
    Project = "terraform-tutorial"
  }
}

output "instance_id" {
  value = "${aws_instance.bastion.id}"
}
