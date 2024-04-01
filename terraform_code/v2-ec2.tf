provider "aws"{
    region="us-east-1"
}

resource "aws_instance" "demo_server"{
    
  ami           = "ami-0c101f26f147fa7fd"  # Specify the AMI ID of your desired instance
  instance_type = "t2.micro"      # Specify the instance type
  key_name = "dpp"
  subnet_id     = "subnet-0c3846ad1148e2307"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.demo_sg.id]


  tags = {
    Name = "demoserver"
  }
}


resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Example security group"
  vpc_id      = "vpc-07880b58b52873374"

  // Inbound rule allowing SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  // Outbound rule allowing all traffic to go out
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-security-group"
  }
}
