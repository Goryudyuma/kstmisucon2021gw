resource "aws_security_group" "player" {
  name = "player_instance"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

resource "aws_spot_instance_request" "player" {
  for_each = local.players

  ami = "ami-0d00b2a9a38084503"
  instance_type = "c5.xlarge"

  subnet_id = aws_subnet.player_subnet.id

  vpc_security_group_ids = [
    aws_security_group.player.id
  ]

  user_data = <<-EOF
#!/bin/bash
mkdir /home/ishocon/.ssh
curl https://github.com/${each.value}.keys > /home/ishocon/.ssh/authorized_keys
curl https://github.com/Goryudyuma.keys >> /home/ishocon/.ssh/authorized_keys
chown -R ishocon:ishocon /home/ishocon/.ssh
EOF

  root_block_device {
    volume_size = 30
  }

  tags = {
    player_name = each.value
  }
}