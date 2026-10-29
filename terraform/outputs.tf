
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.devops_demo.id
}

output "instance_type" {
  description = "Type of the EC2 instance"
  value       = aws_instance.devops_demo.instance_type
}

output "instance_public_ip" {
  description = "Public IP address, if assigned"
  value       = aws_instance.devops_demo.public_ip
}
