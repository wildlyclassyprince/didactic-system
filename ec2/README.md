# Create and start an EC2 instance

First, check if AWS CLI is installed:

```bash
aws --version
```
Then create a key pair:

```bash
aws ec2 create-key-pair --key-name KEY-PAIR-NAME --query 'KeyMaterial' --output text > KEY-PAIR-NAME.pem
```

Set key permissions:

```bash
sudo chmod 400 KEY-PAIR-NAME.pem
```

List instances and copy the instance id of the instance you wish to launch:

```bash
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"
```

Launch the instance:

```bash
aws ec2 run-instances --image-id INSTANCE-ID --count 1 --instance-type t2.micro --key-name KEY-PAIR-NAME --security-group-ids [YOUR SECURITY GROUP ID]
```

Terminate the instance:

```bash
aws ec2 terminate-instances --instance-ids INSTANCE-ID
```