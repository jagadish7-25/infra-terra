variable "env" {
    type = string
    default = "dev"
}
variable "instance_names" {
    type = list(string)
    default = [ "main-server","backup-server" ]
  
}