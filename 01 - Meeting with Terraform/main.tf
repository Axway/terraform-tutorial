provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "bastion" {
  ami = "ami-0018f5be0ccc813c8"
  instance_type = "t2.micro"
}

output "instance_id" {
  value = "${aws_instance.bastion.id}"
}
