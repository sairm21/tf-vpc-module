output "subnet_is" {
  value = aws_subnet.main.*.id
}