aws sqs create-queue --queue-name MyQueue
{
    "QueueUrl": "https://us-west-2.queue.amazonaws.com/181136680031/MyQueue"
}

aws sns subscribe \
    --topic-arn arn:aws:sns:us-west-2:181136680031:leo-topic-affa2f323a2f648280f62b7f001155 \
    --protocol sqs  \
    --notification-endpoint arn:aws:sqs:us-west-2:181136680031:MyQueue

aws sns publish --topic-arn arn:aws:sns:us-west-2:181136680031:leo-topic-affa2f323a2f648280f62b7f001155 --message "Hello World!"

