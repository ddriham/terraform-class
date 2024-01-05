variable "access_key" {
    description = "aws acces key: "
}

variable "machine" {
  description = "enter your instace type: "
}


variable "secret_key" {
    description = "secret key: "
}

variable "region" {
    description = "Choose Your region: "
    default     = "eu-west-1"
}

variable "AMIS" {
    description = "choose your AMI depends on region"
    type = map(string)
    default = {
        eu-west-1    = "ami-0905a3c97561e0b69"
        eu-south-2   = "ami-0a9e7160cebfd8c12"
        eu-central-1 = "ami-0faab6bdbac9486fb"
    }
  
}