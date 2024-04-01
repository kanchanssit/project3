
provider "aws"{
    region="us-east-1"
}

resource "aws_instance" "demo_server"{
    
  ami           = "ami-0c101f26f147fa7fd"  # Specify the AMI ID of your desired instance
  instance_type = "t2.micro"      # Specify the instance type
  key_name = "dpp"
  subnet_id     = "subnet-0c3846ad1148e2307"
  associate_public_ip_address = true 

  tags = {
    Name = "demoserver"
  }
}
