variable "instance_name" {
  description = "Value of the name tag for EC2 instance"
  type        = string
  default     = "InstanciaEC2"
}
variable "contar" {
  description = "Número de instancias a crear"
  type        = number
  default     = 2
}