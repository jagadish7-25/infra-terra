variable "env" {
    type = string
    default = "dev"
}
variable "instance_names" {
    type = list(string)
    default = [ "mysql","backend","frontend" ]
  
}
variable "zone_id" {
    type = string
    default = "Z0430612277F4XGCAJAVA"
  
}
variable "domain_name" {
    type = string
    default = "chocojohns.bar"
  
}
variable "instace_type" {
    type = string
    default = "t2.micro"
  
}