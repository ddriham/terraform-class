resource "aws_kms_key" "this_ddriham" {
    description = "default KMS"
    deletion_window_in_days = 10
  
}

resource "aws_kms_alias" "this_ddriham_alias" {                  # extra block to add name to the key (alias)
  name                    = "alias/ddriham_kms_key"
  target_key_id           = aws_kms_key.this_ddriham.key_id
}