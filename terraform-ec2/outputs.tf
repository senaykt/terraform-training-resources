output "instance_id" {
  value = aws_instance.demo_ec2.id
}

output "public_ip" {
  value = aws_instance.demo_ec2.public_ip
}

output "private_key_pem" {
  value     = tls_private_key.demo.private_key_pem
  sensitive = true
}
