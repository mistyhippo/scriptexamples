URRENT_TIME=$(date "+%Y.%m.%d-%H.%M.%S")
BUCKET_NAME="$CURRENT_TIME-ryan-desmond-backups"

echo "creating bucket with name $BUCKET_NAME"

aws s3 mb s3://$BUCKET_NAME --region us-west-1

echo "changing directories"

cd /Users/ryandesmond/Documents/CodingNomads/scripts/challenge/files

echo "copying files to s3"

aws s3 cp /Users/ryandesmond/Documents/CodingNomads/scripts/challenge/files/ s3://$BUCKET_NAME --recursive --exclude "*" --include "*.txt"

aws s3 cp /Users/ryandesmond/Documents/CodingNomads/scripts/challenge/files/ s3://$BUCKET_NAME --recursive --exclude "*" --include "*.jpg"

echo "S3 transfer complete"

echo "deleting contents of current directory..."

rm -rf /Users/ryandesmond/Documents/CodingNomads/scripts/challenge/files/*

echo "creating new directory..."

mkdir $CURRENT_TIME

echo "moving into new directory..."

cd $CURRENT_TIME

echo "copying files from S3 back to local machine..."

aws s3 cp s3://$BUCKET_NAME . --recursive

echo "transfer complete."
  
echo "script complete."```

Message Input


Message bali_2018_course
