#  python3 inkove.py

import boto3

client = boto3.client('lambda')

response = client.invoke(
    FunctionName='hello_world',
    Payload='{}',
    #Qualifier='1',
)

print(response["ResponseMetadata"])