#!/bin/bash
# Credential
export AWS_ACCESS_KEY_ID=xx
export AWS_SECRET_ACCESS_KEY=xx
export AWS_DEFAULT_REGION=us-west-2

# Create bucket#
echo "EC2 instance"
aws ec2 create-key-pair --key-name LeoKey --query 'KeyMaterial' --output text > LeoKey.pem
chmod 400 LeoKey.pem
VPC=$( aws ec2 describe-vpcs | jq --raw-output ".Vpcs[].VpcId")
SUBID=$(aws ec2 describe-subnets | jq --raw-output ".Subnets[1].SubnetId")
IP=$(curl https://checkip.amazonaws.com)
IMG=ami-04e35eeae7a7c5883
GIDS=$(aws ec2 create-security-group --group-name web-access-sg --description "Leo Linux SG" --vpc-id $VPC | jq --raw-output ".GroupId")
aws ec2 authorize-security-group-ingress --group-id $GIDS --protocol tcp --port 22 --cidr $IP/32
aws ec2 describe-security-groups --group-ids $GIDS
aws ec2 run-instances --image-id $IMG --count 1 --instance-type t2.micro --key-name LeoKey --security-group-ids $GIDS --subnet-id $SUBID

echo ""
echo ""
