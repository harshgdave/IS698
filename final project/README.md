# AWS Cloud Architecture Project – By Harsh

This project demonstrates the design and deployment of a scalable cloud architecture on AWS using both Terraform and CloudFormation. The architecture integrates compute, storage, database, load balancing, and serverless automation using Lambda and S3.

## Architecture Overview

The deployed system includes:
- VPC with public and private subnets  
- EC2 Web Server behind an Application Load Balancer (ALB)  
- RDS MySQL Database  
- S3 bucket with Lambda trigger  
- IAM roles and security groups  
- Boto3 Python automation scripts  
- Terraform for networking resources  
- CloudFormation for application-tier resources  

## Terraform Components
Files:
- main.tf  
- variables.tf  
- outputs.tf  

Terraform provisions:
- VPC  
- Public & private subnets  
- Web, ALB, and DB security groups  

## CloudFormation Components
File:
- project-stack.yaml

Creates:
- EC2 instance with Apache web server  
- ALB, Listener, Target Group  
- Lambda + Permission + S3 Bucket event trigger  
- IAM role for Lambda  
- Outputs for ALB DNS, S3 bucket, Lambda name  

## RDS Database Testing

1. Install MySQL client:  
```bash
sudo dnf install mariadb105 -y
```

2. Connect:
```bash
mysql -h <rds-endpoint> -u adminuser -p
```

3. Create DB and table:
```sql
CREATE DATABASE harshdb;
USE harshdb;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  age INT
);

INSERT INTO users (name, age) VALUES ('Harsh', 24);
SELECT * FROM users;
```

## Boto3 Automation Scripts

### 1. Create S3 bucket + upload file
```python
import boto3, uuid
s3 = boto3.client("s3")
bucket = f"harsh-boto3-{uuid.uuid4()}"
s3.create_bucket(Bucket=bucket)
s3.upload_file("test.txt", bucket, "test.txt")
print("Done:", bucket)
```

### 2. EC2 metadata (run inside EC2)
```python
import requests
md = "http://169.254.169.254/latest/meta-data/"
print(requests.get(md+"instance-id").text)
print(requests.get(md+"public-ipv4").text)
```

### 3. List running EC2s
```python
import boto3
ec2 = boto3.client("ec2")
resp = ec2.describe_instances(Filters=[{"Name":"instance-state-name","Values":["running"]}])
for r in resp["Reservations"]:
    for i in r["Instances"]:
        print(i["InstanceId"], i.get("PublicIpAddress"))
```

### 4. Invoke Lambda
```python
import boto3, json
l = boto3.client("lambda")
resp = l.invoke(FunctionName="harsh-s3-upload-logger",
                Payload=json.dumps({"msg":"hi"}))
print(resp["Payload"].read())
```

## Challenges & Solutions
- EC2 health checks failed → fixed Apache + security groups  
- S3 → Lambda permissions error → added correct Lambda Permission  
- CloudFormation dependency errors → cleaned outputs and ordering  

## Conclusion
This project helped me practice real cloud architecture by deploying a complete AWS environment using Terraform, CloudFormation, Boto3, and EC2/Lambda/S3/RDS integrations.


