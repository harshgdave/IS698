
import boto3

bucket_name = "my-boto3-s3-bucket-harsh"

s3 = boto3.client("s3", region_name="us-east-1")
s3.put_bucket_versioning(
    Bucket=bucket_name,
    VersioningConfiguration={"Status": "Enabled"}
)

status = s3.get_bucket_versioning(Bucket=bucket_name).get("Status", "Unknown")
print(f"Versioning enabled for bucket {bucket_name}! Status: {status}")
