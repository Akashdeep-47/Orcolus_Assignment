# Orcolus_Assignment
<h4> Scenario - Upload all the files and directories in a drive older than a day to AWS and delete them from the drive. </h4>

---

## Step 1: Install AWS and configure AWS CLI User.
1. To install AWS in the Ubuntu system as I will be using the Ubuntu as my system, if you are using the same, then you can follow the process. <br>
   ``` sudo apt-get install awscli ```
2. Check version to verify once, if installed correctly. <br>
   ``` aws --version ```
3. Now configue AWS CLI User crdentials. <br>
   ``` aws configure ``` <br>
   ``` AWS Access Key ID : <* Enter your access key *> ``` <br>
   ``` AWS Secret Access Key ID : <* Enter your secret access key *> ``` <br>
   ``` Default region name : <* Your Choice *> ``` <br>
   ``` Default output format : <* Just press ENTER key *> ```
   
---

## Step 2: Creating a bucket using AWS CLI.
``` aws s3 mb s3://<* bucket-name *> --region <* your-choice *> ``` <br>
``` mb ``` command is used to create bucket for the user. <br>
``` bucket-name ``` should br unique. 

---

## Step 3: Creating the Script for sending files and folder to the S3 bucket.
``` find ${working_dir}* -mtime +${days_to_data} -exec aws s3 mv s3://orcolus-bucket {} \; ``` <br>
1. ``` ${working_dir}* ``` the first argument containing the full path of the directory where all file and folders are stored. <br>
2. ``` -mtime +${days_to_data} ``` the second argument ``` -mtime ```, is used to specify the number of days old that the file is. If you enter +10, it will find files older than 10 days. <br>
3. ``` ${days_to_data} ``` is the variable used which is assigned 1 which means 1 day old. <br>
4. ``` -exec ``` the third argument that allows you to pass in a command such as mv. The {} \; at the end is required to end the command. <br>
5. ``` aws s3 mv s3://orcolus-bucket {} ``` this command is used to move file from drive to S3 bucket. 

--- 

## Step 4:
Deleting the files and folders from the local drive. <br>
``` find ${working_dir}* -mtime +${days_to_data} -exec rm {} \; ``` <br>
1. ``` rm ``` this command is used to removes all local files. <br>
2. Rest all are arguments are same as above [Step 3].

--- 

## Final Script : 
``` 
#!/bin/bash

#Setting variables.
working_dir=/home/akashdeep/Documents/Ocrolus/
days_to_data=1


#Now sending file to S3 bucket.
find ${working_dir}* -mtime +${days_to_data} -exec aws s3 mv s3://orcolus-bucket {} \;

#Now deleting file from drive.
find ${working_dir}* -mtime +${days_to_data} -exec rm {} \;

``` 
1. ``` #!/bin/bash ``` called as she-bang, used to recognize that its a bash file.
2. Rest explained in [Step-3] and [Step-4].





