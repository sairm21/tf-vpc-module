variable "cidr_block" {}
variable "env" {}
variable "tags" {}
variable "subnets" {}
variable "az" {
  default = ["us-east-1a", "us-east-1b"]
}
variable "default_VPC_id" {}
variable "default_Route_table_ID" {}