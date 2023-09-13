# ECR

https://docs.aws.amazon.com/pt_br/AmazonECR/latest/userguide/getting-started-cli.html

export aws_account_id=xxx
export region=us-west-2

# Login

aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $aws_account_id.dkr.ecr.$region.amazonaws.com

# Create Repo

aws ecr create-repository \
    --repository-name app-repository \
    --image-scanning-configuration scanOnPush=true \
    --region $region

# Tag and pushs image
docker tag app:latest $aws_account_id.dkr.ecr.$region.amazonaws.com/app-repository

docker push $aws_account_id.dkr.ecr.$region.amazonaws.com/app-repository

docker images
