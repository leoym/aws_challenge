import json

def lambda_handler(event, context):
    # TODO implement
    print("Event: " + str(event))
    #print(event['key1'])
    print("Context: " + str(context))

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
