from flask import Flask, request, render_template
import requests
import boto3
import json

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World !!!'

@app.route('/message_form')
def message_form():
    return render_template('message-form.html')

@app.route('/message',methods = ['POST', 'GET'])
def message():
   if request.method == 'POST':
      fname = request.form['fname']
      lname = request.form['lname']
      status = request.form['status']
      
      user = fname + " " + lname + " - " + status
      teste(fname, lname, status)
      return user
   else:
      user = request.args.get('nm')
      return user

def teste(fname, lname, status):
    client = boto3.client('lambda')

    payload3=b"""{
        "fname": "John",
        "lname": "Doe",
        "status": "Active"
    }"""
    print(payload3)
    response = client.invoke(
            FunctionName="lambda_send_sns",
            InvocationType='Event',
            Payload='{"fname" : "' + fname + '", "lname": "' + lname + '", "status": "' + status + '" }'
        )
    print(str(response))
    print("\n")

if __name__ == "__main__":
    app.run()