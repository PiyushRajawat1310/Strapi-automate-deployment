variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = "strapi-key"
}

variable "docker_image" {
  description = "Docker image for Strapi"
  type        = string
  default     = "YOUR_DOCKERHUB_USERNAME/strapi:latest"
}
