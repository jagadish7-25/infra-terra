variable "var.name" {
  description = "The name of the variable"
  type        = string
  default     = "allow_all_traffic"
  
}
variable "var.vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
  default     = "vpc-0a625d074cfa680c9"
  
}
variable "var.ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-09c813fb71547fc4f"
  
}
variable "var.instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"
  
}
