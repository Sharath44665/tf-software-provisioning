variable "AWS_ACCESS_KEY" { }
variable "AWS_SECRET_KEY" { }
variable "AWS_REGION" {
    default = "ap-south-1"
}

variable "AMIS" {
  type=map

  default = {
    ap-south-1="ami-068257025f72f470d"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}