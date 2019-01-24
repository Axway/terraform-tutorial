variable "project" {}
variable "platform" {}
variable "team" {}
variable "ssh_public_key" {}
variable "ami" {
  default = "ami-3b261642"
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
  key_name = "${aws_key_pair.key_pair.key_name}"
  vpc_security_group_ids = [
    "${aws_security_group.dmz_sg.id}"]
  subnet_id = "${aws_subnet.public_subnet_1.id}"
  user_data = <<-EOF
              #!/bin/bash
              set -xv
              echo 'export PS1="(${var.platform}-bastion) PS1"' >> /etc/bashrc
              EOF
}

resource "aws_eip" "bastion_public_ip" {}

resource "aws_eip_association" "bastion_public_ip_association" {
  instance_id = "${aws_instance.bastion.id}"
  allocation_id = "${aws_eip.bastion_public_ip.id}"
}

resource "aws_key_pair" "key_pair" {
  key_name = "${var.project}_${var.platform}"
  public_key = "${var.ssh_public_key}"
}

output "key_pair_name" {
  value = "${aws_key_pair.key_pair.key_name}"
}

output "internal_sg_id" {
  value = "${aws_security_group.internal_sg.id}"
}

output "internal_subnet_1" {
  value = "${aws_subnet.private_subnet_1.id}"
}
