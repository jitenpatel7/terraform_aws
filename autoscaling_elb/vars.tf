variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "access_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "access_key.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-2 = "ami-0a614b729ef585e96"
  }
}

