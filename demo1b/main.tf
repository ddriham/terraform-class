# create a resource

resource "aws_instance" "ddriham-example" {
    count         = 1
    ami           = "${var.AMIS[var.region]}"
    instance_type = "t2.micro"
}