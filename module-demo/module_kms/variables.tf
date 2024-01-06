variable "alias" {
    description = "Alias name to KMS KEY "
    type = string
}


variable "description" {
    description = "Description record to KMS key "
    type = string
    default = "Default Description to KMS key"
}


variable "deletion_window_in_days" {
    description = "Deletion Period"
    type = number
    default = 13
  
}