
#!/bin/bash


CURRENT_DAY=$(date "+%Y.%m.%d-%H.%M.%S")
BUCKET_NAME="$CURRENT_DAY-mistyhippobackups"

echo Creating S3 bucket with todays date ...
aws s3 mb s3://$BUCKET_NAME --region eu-west-1 

echo Changing into root directory of the folder containing files to be uploaded to S3
cd /home/zoning/Documents/codingnomads/scriptchallenge/scripting_challenge/scripting_challenge

echo transferring all .txt files and images into our new fancy bucket
aws s3 cp /home/zoning/Documents/codingnomads/scriptchallenge/scripting_challenge/scripting_challenge  s3://$BUCKET_NAME --recursive --exclude "*" --include "*.txt"
aws s3 cp /home/zoning/Documents/codingnomads/scriptchallenge/scripting_challenge/scripting_challenge  s3://$BUCKET_NAME --recursive --exclude "*" --include "*.jpg"

echo Making new directory with todays date
mkdir $CURRENT_DAY

echo Changing into this new directory. Hopefully no seasickness with allthis movement
cd $CURRENT_DAY

echo Move the ish back to the new directory
aws s3 sync s3://$BUCKET_NAME --region eu-west-1 /home/zoning/Documents/codingnomads/scriptchallenge/scripting_challenge/scripting_challenge   

echo transfer done
echo script finished successfully

