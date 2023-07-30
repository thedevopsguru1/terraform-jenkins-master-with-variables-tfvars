variable "vpc" {
  description = "jenkins vpc"
  type        = string

}

variable "az" {
  description = " AZ"
  type        = list(any)

}

variable "subnet_cidr" {
  description = " Subnets for jenkins vpc"
  type        = list(any)
}

variable "ssh" {
  description = " SSH"
  type        = any
}

variable "internet" {
  description = "Internet connection"
  type        = any
}

variable "jenkins_port" {
  description = "Lb-Jenkins connection"
  type        = any
}

variable "http" {
  description = "setup http/s port"
  type        = list(any)
}

variable "all" {
  description = " SSH"
  type        = any
}

variable "ami" {
  description = "AMI used is centos 7"
}

variable "instance_type" {
  description = "Instance type"
  type        = list(any)
}