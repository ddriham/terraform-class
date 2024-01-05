variable "access_key" {
    description = "AWS Access Key"
}
variable "secret_key" {
    description = "AWS Secret Key"
}
variable "region" {
    description = "Insert your AWS Region Code"
    default     = "eu-west-1"
}

variable "AMIS" {
    description = "choose your ami depends on region"
    type = map(string)
    default = {
        us-east-1    = "ami-0c7217cdde317cfec"
        eu-west-1    = "ami-0905a3c97561e0b69"
        eu-central-1 = "ami-0faab6bdbac9486fb"
    }
}
