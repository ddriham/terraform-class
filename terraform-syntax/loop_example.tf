variable "instances" {              # usually this block will go to variables.tf
    type = map(object({
        ami = string
        instance_type = string
    }))
    default = {
      example-instance-1 = {
        ami = "ami-dwnuwdundwn"
        instance_type = "t2.micro"
      }
      example-instance-2 = {
        ami = "ami-dwnfwasasa"
        instance_type = "t2.xlarge"
      }
    }
}


resource "aws_instance" "example" {
    for_each = var.instances
    ami = each.value.ami       # each ami of instance
    instance_type = each.value.instance_type # each instace type (the current object)
  
}