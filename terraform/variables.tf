variable "region" {
  default = "ap-south-1"
}

variable "image_url" {
  description = "ECR image URL"
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {}

