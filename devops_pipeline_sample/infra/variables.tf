variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami" {
  type    = string
  default = "REPLACE_WITH_AMI_ID"
}

variable "ssh_key_name" {
  type    = string
  default = "REPLACE_WITH_SSH_KEY_NAME"
}
