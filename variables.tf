variable "cidr_block" {}
variable "env" {}
variable "tags" {}
variable "vpc_id" {}
variable "subnets" {}
variable "az" {
  default = ["us-east-1a", "us-east-1b"]
}
