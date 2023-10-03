import boto3
import os

# Define the table name
TABLE_NAME = os.environ.get("DYNAMODB_TABLE_NAME", "counter")

# Initialize the DynamoDB client and resource
db_client = boto3.client('dynamodb')
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(TABLE_NAME)

def lambda_handler(event, context):
    try:
        # Attempt to retrieve the view count from DynamoDB
        item = table.get_item(Key={"id": 0}).get("Item")
        viewrcount = item.get("viewrcount", 0)
    except KeyError:
        # Handle the case where the "viewrcount" attribute does not exist
        viewrcount = 0

    # Increment the view count
    db_client.update_item(
        TableName=TABLE_NAME,
        Key={"id": {"N": "0"}},
        UpdateExpression="ADD viewrcount :inc",
        ExpressionAttributeValues={":inc": {"N": "1"}}
    )

    # Prepare the response
    response = {
        "headers": {
            "content-type": "application/json"
        },
        "status_code": 200,
        "body": {
            "count": viewrcount
        }
    }

    return response