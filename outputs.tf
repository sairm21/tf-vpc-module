output "subnet_id" {
  value = module.subnets
}

output "vpc_id" {
  value = aws_vpc.main.id
}