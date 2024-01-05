

Conditional


resource "aws_s3_bucket" "default" {
    bucket = var.custom_name != "" ? var.custom_name : default 
    acl = private
  
}



Loop

variable "users" {
    type = map(object{ is_admin = boolean})
  
}

locals {
  admin_users = {
    for name, user in var.users : name => user
    if user.is_admin
  }
}