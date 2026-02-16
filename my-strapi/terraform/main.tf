resource "aws_security_group" "strapi_sg" {
  name        = "strapi-sg-final"
  description = "Allow SSH and Strapi"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "strapi_server" {
  ami           = "ami-0f5ee92e2d63afc18" # Ubuntu 22.04 ap-south-1
  instance_type = "t3.micro"
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.strapi_sg.id]

  user_data = <<-EOF
#!/bin/bash
set -eux

# Update system
apt-get update -y

# Install Docker
apt-get install -y docker.io

# Start & enable Docker
systemctl start docker
systemctl enable docker

# Wait for Docker to be fully ready
until docker info >/dev/null 2>&1; do
  sleep 3
done

# Pull image
docker pull ${var.docker_image}

# Remove old container if exists
docker rm -f strapi || true

# Run Strapi container
docker run -d \
  -e HOST=0.0.0.0 \
  -e PORT=1337 \
  -p 1337:1337 \
  --restart always \
  --name strapi \
  ${var.docker_image}
EOF


  tags = {
    Name = "Strapi-Server"
  }
}
