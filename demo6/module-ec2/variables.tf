variable "platform" {
    default = "ubuntu"
    description = "The OS Platform"
  
}

variable "user" {
    default = {
        ubuntu  = "ubuntu"
        rhel6   = "ec2-user"
        centos7 = "centos"
        rhel7   = "ec2-user"
    }
}

variable "ami" {
    description = "AWS AMI ID"

    default = {
        us-east-1-ubuntu    = "ami-0c7217cdde317cfec"
        eu-west-1-ubuntu    = "ami-0905a3c97561e0b69"
        eu-central-1-ubuntu = "ami-0faab6bdbac9486fb"
        us-west-1-ubuntu    = "ami-0ce2cb35386fc22e9"
    }

}

variable "service_conf" {
    default = {
        ubuntu  =  "apache2.service"
        rhel6   =  "httpd"
        centos7 = "httpd"
        rhel7   =  "httpd"
    }
  
}

variable "key_name" {
    description = "SSH key name in your AWS account"
  
}

variable "key_path" {
    description = "Path to the private key "
  
}

variable "region" {
    default = "eu-west-1"
  
}

variable "servers" {
    default = 2
    description = "the number of server to launch "
  
}

variable "instance_type" {
    default = "t2.micro"
  
}

variable "TagName" {
    default = "ddriham-app"
  
}

variable "subnets" {
    type = map
    description = "map of subnets to deploy your resources"
}

variable "vpc_id" {
    type = string
    description = "ID of the vpc to use"
  
}