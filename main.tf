provider "aws" {
  region = "us-west-2"  # Specify your region
}

resource "aws_ecs_cluster" "example_cluster" {
  name = "example-cluster"
}

resource "aws_security_group" "ecs_security_group" {
  name        = "ecs-security-group"
  description = "Security group for ECS tasks"
  vpc_id      = "your_vpc_id"  # Update with your VPC ID

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.example_cluster.name
}

