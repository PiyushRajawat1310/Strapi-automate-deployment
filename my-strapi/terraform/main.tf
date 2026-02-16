provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "strapi" {
  ami           = var.ami
  instance_type = "t3.micro"
  key_name      = var.key_name

  user_data = <<-EOF
#!/bin/bash
set -e

apt-get update -y
apt-get install -y docker.io

systemctl enable docker
systemctl start docker

sleep 20

docker pull ${var.image}

docker rm -f strapi || true

docker run -d \
  --restart always \
  --name strapi \
  -e HOST=0.0.0.0 \
  -e PORT=1337 \
  -p 1337:1337 \
  ${var.image}
EOF


  tags = {
    Name = "strapi-server"
  }
}

