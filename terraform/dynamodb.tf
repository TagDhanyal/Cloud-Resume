resource "aws_dynamodb_table" "dynamodbtable" {
  name           = "counter"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"
  attribute {
    name = "id"
    type = "N"
  }

  global_secondary_index {
    name               = "idIndex"
    hash_key           = "id"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "KEYS_ONLY"
  }

}

resource "aws_dynamodb_table_item" "tableitem" {
  table_name = aws_dynamodb_table.dynamodbtable.name
  hash_key   = aws_dynamodb_table.dynamodbtable.hash_key

  item = <<ITEM
{
  "id": {"N": "0"}
}
ITEM
}

