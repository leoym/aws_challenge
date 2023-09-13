#!/bin/bash
# Credential
export AWS_ACCESS_KEY_ID=x
export AWS_SECRET_ACCESS_KEY=xxx
export AWS_DEFAULT_REGION=us-west-2
export ACCOUNT=xxx
export REGION=us-west-2

TOPIC_NAME=topic-users
TOPIC_ARN=$(aws sns create-topic --name $TOPIC_NAME | jq --raw-output ".TopicArn")

QUEUE_NAME=queue-users
QUEUE_URL=$(aws sqs create-queue --queue-name $QUEUE_NAME | jq --raw-output ".QueueUrl")

aws sns subscribe \
    --topic-arn arn:aws:sns:$REGION:$ACCOUNT:$TOPIC_NAME \
    --protocol sqs  \
    --notification-endpoint arn:aws:sqs:$REGION:$ACCOUNT:$QUEUE_NAME
