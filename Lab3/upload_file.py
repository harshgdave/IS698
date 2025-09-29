import boto3

bucket_name = "my-boto3-s3-bucket-harsh"   
file_name   = "myfile.txt"         

s3 = boto3.client("s3", region_name="us-east-1")

# create the local file
with open(file_name, "w") as f:
    f.write("Hello S3")

# upload to S3
s3.upload_file(file_name, bucket_name, file_name)
print(f"Uploaded {file_name} to s3://{bucket_name}/{file_name}")
