###    Conditional resources



variable "int_tg_flag" {
    description = "internal TG flag"
    type = bool
    default = false
}


resource "aws_lb_target_group" "internal" {
    count = var.int_tg_flag ? 1 : 0
    name  = "tg-${var.name}-internal"
    port = var.tg_port
    protocol = var.tg_protocol
    vpc_id = var.vpc_id
}


