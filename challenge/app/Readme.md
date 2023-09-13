# Reference 

https://pythonbasics.org/webserver/

https://hub.docker.com/_/python

https://boto3.amazonaws.com/v1/documentation/api/latest/guide/quickstart.html

https://blog.devops.dev/docker-building-containers-with-python-and-boto3-a14419fe4f3


# Credentialss
export AWS_ACCESS_KEY_ID=xxx
export AWS_SECRET_ACCESS_KEY=xxx
export AWS_DEFAULT_REGION=us-west-2
export aws_account_id=xxx
export region=us-west-2

# Build
docker build -t app .

# Run
docker run -p 8080:8080 app
