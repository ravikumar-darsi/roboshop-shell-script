#!/bin/bash

AMI=ami-0b4f379183e5706b9 #this keeps on changing
SG_ID=sg-093a057bce942d496 #replace with your SG ID
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
ZONE_ID=Z104317737D96UJVA7NEF # replace your zone ID
DOMAIN_NAME="daws67s.online"

for i in "${INSTANCES[@]}"
do
    echo "instance is: $i
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
        #INSTANCE_TYPE="t3.small"
        INSTANCE_TYPE="t3.micro"
    else
        INSTANCE_TYPE="t2.micro"
    fi
    aws ec2 run-instances --image-id ami-0b4f379183e5706b9  --instance-type $INSTANCE_TYPE --security-group-ids sg-093a057bce942d496 
done