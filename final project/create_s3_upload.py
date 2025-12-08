import boto3
import uuid

s3 = boto3.client('s3')

bucket_name = f"harsh-boto3-bucket-{uuid.uuid4()}"
file_name = "sample.txt"

# Create bucket
s3.create_bucket(Bucket=bucket_name)
print(f"Bucket created: {bucket_name}")

# Upload file
with open(file_name, "w") as f:
    f.write("Hello from Harsh's Boto3 script!")

s3.upload_file(file_name, bucket_name, file_name)
print("File uploaded successfully!")
