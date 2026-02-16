variable "aws_region" {
  default = "ap-south-1"
}

variable "ami" {
  default = "ami-0f5ee92e2d63afc18" # Ubuntu 22.04 Mumbai
}

variable "key_name" {
  default = "strapi-key"
}

variable "image" {
  description = "Docker image"
}

