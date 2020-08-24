!# /bin/bash --

echo -e "Running $(aws --version)\n"

# Create key pair
aws ec2 create-key-pair --key-name TestKeyPair --query 'KeyMaterial' --outoput text > TestKeyPair.pem

# Set key permission
sudo chmod 400 TestKeyPair.pem

# List instances
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"

# Launch instance
# You will need the security group id from the AWS Console
aws ec2 run-instances --image-id ami-082bdb3b2d54d5a19 --count 1 --instance-type t2.micro --key-name TestKeyPair --security-group-ids [YOUR SECURITY GROUP ID]

# List instances
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"

# Terminate instance
aws ec2 terminate-instances --instance-ids i-503422c