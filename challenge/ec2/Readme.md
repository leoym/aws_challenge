# Readme

aws ec2 describe-instances

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html

# User data sample

#!/bin/bash
sudo yum update -y
sudo yum install php8.2 -y 
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
sudo find /var/www -type d -exec chmod 2775 {} \;
sudo find /var/www -type f -exec chmod 0664 {} \;
sudo hostname > /var/www/html/hostname.html
sudo echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php


# Creating ELB

1) Create a SG
2) Create Target group
3) Create ELB

----
#Creating ASG

