resource "aws_security_group" "allow_all_traffic" {
  name        = "allow_all_traffic"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0a625d074cfa680c9"
  tags = {
    Name = "allow_all_traffic"
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

    ami = "ami-09c813fb71547fc4f"
    instance_type = var.env == "prod" ? "t3.medium" : "t2.micro"
    
    count = "var.env" == "prod" ? 3: 2 
    vpc_security_group_ids = [aws_security_group.allow_all_traffic.id]
    tags = {
        Name = var.instance_names[count.index] 
    }
}