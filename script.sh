#!/bin/bash

#Setting variables.
working_dir=/home/akashdeep/Documents/Ocrolus/
days_to_data=1


#Now sending file to S3 bucket.
find ${working_dir}* -mtime +${days_to_data} -exec aws s3 mv s3://orcolus-bucket {} \;

#Now deleting file from drive.
find ${working_dir}* -mtime +${days_to_data} -exec rm {} \;
