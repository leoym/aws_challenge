import json
import boto3
import datetime

client = boto3.client('sns')

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('users')

def lambda_handler(event, context):
   print("Evento: " + str(event))
   
   response = client.publish(TopicArn='arn:aws:sns:us-west-2:704677942812:topic-users', Message=str(event))
   print("Message published")
   
   fname = event["fname"]
   lname = event["lname"]
   status = event["status"]
   print (fname)
   
   text = 'fname' +  str(datetime.datetime.now())
   user = fname + str(hash(text))
    
   payload = {
            'username': user,
            'first_name': fname,
            'last_name': lname,
            'age': 25,
            'account_type': 'standard_user',
            'status' : status
        }
   table.put_item(
       Item=payload
   )
   print ("Item added: " + str(event))
   
   return(response)