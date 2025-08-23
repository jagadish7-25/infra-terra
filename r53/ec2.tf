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
resource "aws_instance" "expense" {

    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    
    count = length(var.instance_names)
    vpc_security_group_ids = [aws_security_group.allow_all_traffic.id]
    tags = {
        Name = var.instance_names[count.index] 
    }
}

  
resource "aws_route53_record" "chocojohns" {
  count  = length(var.instance_names)
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 5
  records = [aws_instance.expense[count.index].private_ip]
}