variable "team" {
  default = "condor"
}

variable "project" {
  default = "terraform-tutorial"
}

variable "my_ip_address" {
  type = "list"
  description = "my public ip address"
  default = [
    "1.1.1.1/32",
  ]
}

variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEArIuRoZTVdlH20bugzBVn56pmzG/si0IWU8rykpFxZu1OEDFGI7MtKpPHQ37gEtFJUnwRuMttGGb6pZVIe1I0zRaSIUdnus0KEITQjDbid7qza4sXY7M5+LX/gwZAHTX4hHYMwhMS1iLI7gjBEjsTSySmBHb4qmPqq9zDl6l9eNyxImmIfCUeIODVt3jHxRzvW1PFBzf87TmlzfAeW5y+bZjW9HX7BmZ3RjOwh16nFOFf4sRw7mAQxWBQZehlggvGXfwXc6dhT4hk87OXhdYdJ7CkxlSi2E0iAYke8T78DcYozNFDK+QBHtU2JkMqy6ML7WZj68N4TddfnKB8e/SISw== terraform tutorial"
}
