#!/bin/bash
# Credential
export AWS_ACCESS_KEY_ID=xx
export AWS_SECRET_ACCESS_KEY=xx
export AWS_DEFAULT_REGION=us-west-2

# Create bucket
echo "Creating S3 buckets"
REGION=us-west-2
DATE=$(date)
HASH=$(echo -n foobar $DATE | sha256sum)
BUCKET=leo-lab-${HASH:0:30}
echo $BUCKET
#aws s3api create-bucket --bucket $BUCKET #'region us-west-2
aws s3 mb s3://$BUCKET
#echo 'Bucket '$BUCKET' created!'
echo ""
aws s3 ls 
echo ""

#Create SNS topic
echo "Creating SNS topic"
TOPIC=leo-topic-${HASH:0:30}
aws sns create-topic --name $TOPIC
echo 'Topic '$TOPIC' created!'
echo ""
aws sns list-topics | jq ".Topics[].TopicArn"
# Examples
aws sns subscribe --topic-arn arn:aws:sns:us-west-2:181136680031:leo-topic-35f2cb021d5e1783e213fde1d253b1 --protocol email --notification-endpoint leoyasu@yahoo.com.br
aws sns publish --topic-arn arn:aws:sns:us-west-2:181136680031:leo-topic-35f2cb021d5e1783e213fde1d253b1 --message "Hello World!"

echo ""

# Create DynamoDB table
echo "Creating DynamoDB table"
aws dynamodb create-table \
    --table-name MusicCollection \
    --attribute-definitions AttributeName=Artist,AttributeType=S AttributeName=SongTitle,AttributeType=S \
    --key-schema AttributeName=Artist,KeyType=HASH AttributeName=SongTitle,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1

echo 'Table created!'
aws dynamodb put-item \
    --table-name MusicCollection \
    --item '{
        "Artist": {"S": "No One You Know"},
        "SongTitle": {"S": "Call Me Today"} ,
        "AlbumTitle": {"S": "Somewhat Famous"} 
      }' \
    --return-consumed-capacity TOTAL

aws dynamodb put-item \
    --table-name MusicCollection \
    --item '{
        "Artist": {"S": "No One You Know"},
        "SongTitle": {"S": "Call Me Today"} ,
        "AlbumTitle": {"S": "Somewhat Famous"} 
      }' \
    --return-consumed-capacity TOTAL

echo ""

aws dynamodb query --table-name MusicCollection \
    --key-condition-expression "Artist = :v1 AND SongTitle = :v2" \
    --expression-attribute-values file://expression-attributes.json

echo ""