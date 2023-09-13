# Lambda

# Event Sources

# Invoke

aws lambda invoke \
    --function-name hello_world \
    --cli-binary-format raw-in-base64-out \
    --payload '{ "name": "Bob" }' \
    response.json

aws lambda invoke     --function-name hello_world     --payload '{ "name": "Bob" }'     response.json

# Reference

https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/lambda/client/invoke.html
https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/lambda.html

https://docs.aws.amazon.com/cli/latest/reference/lambda/invoke.html
https://docs.aws.amazon.com/pt_br/lambda/latest/dg/gettingstarted-awscli.html