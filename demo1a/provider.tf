# create a resource

resource "aws_instance" "ddriham-example" {
    count         = 1
    ami           = "ami-0905a3c97561e0b69"
    instance_type = "t2.micro"
}