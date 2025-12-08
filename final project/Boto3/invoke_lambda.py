import boto3
import json

lambda_client = boto3.client('lambda')

response = lambda_client.invoke(
    FunctionName="harsh-s3-upload-logger",
    InvocationType="RequestResponse",
    Payload=json.dumps({"message": "Manual invocation test"})
)

print("Lambda Response:")
print(response['Payload'].read().decode())

