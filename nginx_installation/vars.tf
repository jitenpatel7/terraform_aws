variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0a21832a1cd2d7ea3"
    us-west-1 = "ami-02c4faee7407cf92e"
    eu-west-1 = "ami-0bdabc5ea3c4a0420"
    eu-west-2 = "ami-0a614b729ef585e96"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "access_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "access_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

