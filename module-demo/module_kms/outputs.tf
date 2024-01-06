output "alias" {
    value = var.alias
  
}

output "id" {
    value = concat(aws_kms_key.this.*.id, [""])[0] # the outout of id is a strange list
                                                   # we added the concat command to turn it to a string  
}