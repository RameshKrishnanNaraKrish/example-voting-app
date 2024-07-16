terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Create a ec2_instance
resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = "mykey"
  associate_public_ip_address = "true"

  tags = {
    Name = "Instance ${var.instance_type} terraform"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt install ansible -y",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible"
    ]
  }

}

