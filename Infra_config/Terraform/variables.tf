variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  type= string
  default = "t2.medium"
}

variable "ami_id" {
  description = "amazon machine image"
  default     = "ami-0e001c9271cf7f3b9"
}