# ECR
# Login
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $aws_account_id.dkr.ecr.$region.amazonaws.com
# Create Repo
aws ecr create-repository \
    --repository-name app-repository \
    --image-scanning-configuration scanOnPush=true \
    --region $region

# Tag and pushs image
docker build -t app .
docker tag app:latest $aws_account_id.dkr.ecr.$region.amazonaws.com/app-repository
docker push $aws_account_id.dkr.ecr.$region.amazonaws.com/app-repository
docker images