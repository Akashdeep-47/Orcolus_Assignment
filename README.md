# Orcolus_Assignment
<h4> Scenario - Upload all the files and directories in a drive older than a day to AWS and delete them from the drive. </h4>

---

## Step 1: Install AWS and configure AWS CLI User.
1. To install AWS in Ubuntu system as I will be using Ubuntu as my system, if you have same then you can follow the process. <br>
   ``` sudo apt-get install awscli ```
2. Check version to verify once, if installed correectly. <br>
   ``` aws --version ```
3. Now configue AWS CLI User crdentials. <br>
   ``` aws configure ``` <br>
   ``` AWS Access Key ID : <* Enter your access key *> ``` <br>
   ``` AWS Secret Access Key ID : <* Enter your secret access key *> ``` <br>
   ``` Default region name : <* Your Choice *> ``` <br>
   ``` Default output format : <* Just press ENTER key *> ```
   
---

## Step 2: Creating a bucket using AWS CLI
``` aws s3 mb s3://<* bucket-name *> --region <* your-choice *> ``` <br>
``` mb ``` command is used to create bucket for the user. <br>
``` bucket-name ``` should br unique. 

---

## Step 3:
Creating the Script for sending files and folder to S3 bucket.
``` find ${working_dir}* -mtime +${days_to_data} -exec aws s3 mv s3://orcolus-bucket {} \; ``` <br>


