variable "sg_port" {
  type = list(number)
  description = "list of ingress port"
  default = [ 2020 , 2021 , 3030 , 3031 ]
}