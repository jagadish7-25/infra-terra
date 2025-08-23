data "aws_ami" "finding" {
  most_recent = true

  owners = ["973714476881"]
  tags = {
    Name   = "terraform"
    instace_type = "t2.micro"
  }
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
   
}
output "ami_name" {
  value = data.aws_ami.finding.name
}

output "ami_description" {
  value = data.aws_ami.finding.description
}
