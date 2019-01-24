provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "bastion" {
  ami = "ami-3b261642"
  instance_type = "t2.micro"
}

output "instance_id" {
  value = "${aws_instance.bastion.id}"
}
