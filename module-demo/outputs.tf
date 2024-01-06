output "key_alias" {
    value = module.kms.alias
  
}

output "key_arn" {
    value = module.kms.id
  
}