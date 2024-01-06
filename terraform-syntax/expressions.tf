

Conditional


resource "aws_s3_bucket" "default" {
    bucket = var.custom_name != "" ? var.custom_name : default # there is no if on terraform
    acl = private                                              # in this case if custo_name is not empty use it else use default
  
}



Loop

variable "users" {
    type = map(object({
       is_admin = boolean
  }))
  
}

locals {
  admin_users = {
    for name, user in var.users : name => user
    if user.is_admin
  }
}