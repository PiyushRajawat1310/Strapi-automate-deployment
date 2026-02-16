provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "strapi" {
  ami           = var.ami
  instance_type = "t3.micro"
  key_name      = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install docker.io -y
    systemctl start docker
    docker run -d -p 1337:1337 ${var.image}
  EOF

  tags = {
    Name = "strapi-server"
  }
}

