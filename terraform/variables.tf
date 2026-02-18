variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "image_url" {
  type = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

