output "app_public_ip" {
  description = "Public IP of the application server"
  value       = aws_instance.app.public_ip
}
