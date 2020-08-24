# didactic-system
Collection of AWS CLI scripts

## Connect to EC2 instance
1. Run
```bash
. create-ec2-instance.sh`
```

2. Then tunnel into the instance:
```bash
ssh -i "TestKeyPair.pem" [USERNAME]@[PUBLIC IP or PUBLIC AWS DNS]
```

## Delete the instance
aws ec2 terminate-instances --instance-ids [YOUR INSTANCE ID]