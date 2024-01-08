output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "The IDs of the created public subnets"
  value       = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id, aws_subnet.main-public-3.id]
}

output "private_subnet_ids" {
  description = "The IDs of the created private subnets"
  value       = [aws_subnet.main-private-1.id, aws_subnet.main-private-2.id, aws_subnet.main-private-3.id]
}