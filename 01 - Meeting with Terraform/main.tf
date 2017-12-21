provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "bastion" {
  ami = "ami-7cbc6e13"
  instance_type = "t2.micro"
}

output "instance_id" {
  value = "${aws_instance.bastion.id}"
}
