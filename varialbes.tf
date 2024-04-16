variable "env_prefix" {
  description = "Prefix for the environment"
  type        = string
}

variable "service_name" {
  description = "Name of the service"
  type        = string
}

variable "aws_profile" {
  default = "default"
}

variable "aws_region" {
  default = "ap-northeast-1"
}

