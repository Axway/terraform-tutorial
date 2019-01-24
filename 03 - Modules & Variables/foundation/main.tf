variable "project" {}
variable "platform" {}
variable "team" {}
variable "ami" {
  default = "ami-0018f5be0ccc813c8"
}

resource "aws_instance" "bastion" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  tags {
    Name = "${var.platform}_bastion"
    Project = "${var.project}"
    Platform = "${var.platform}"
    Team = "${var.team}"
  }
}

output "instance_id" {
  value = "${aws_instance.bastion.id}"
}
