resource "aws_security_group" "allow_all_traffic" {
  name        = "var.name"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "var.vpc_id"
  tags = {
    Name = "var.name"
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

}

}
resource "aws_instance" "terraform" {

    ami = "var.ami"
    instance_type = "var.instance_type"
    vpc_security_group_ids = [aws_security_group.allow_all_traffic.id]
    tags = {
        Name = "terraform"
    }
}