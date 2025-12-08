import requests

metadata_url = "http://169.254.169.254/latest/meta-data/"

instance_id = requests.get(metadata_url + "instance-id").text
public_ip = requests.get(metadata_url + "public-ipv4").text

print("Instance ID:", instance_id)
print("Public IP:", public_ip)
