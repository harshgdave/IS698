import requests

TOKEN_URL = "http://169.254.169.254/latest/api/token"
METADATA_URL = "http://169.254.169.254/latest/meta-data/"

# Step 1: Get IMDSv2 token
token = requests.put(
    TOKEN_URL,
    headers={"X-aws-ec2-metadata-token-ttl-seconds": "21600"}
).text

headers = {"X-aws-ec2-metadata-token": token}

# Step 2: Fetch metadata values
instance_id = requests.get(METADATA_URL + "instance-id", headers=headers).text
public_ip = requests.get(METADATA_URL + "public-ipv4", headers=headers).text

print(f"Instance ID: {instance_id}")
print(f"Public IP: {public_ip}")

