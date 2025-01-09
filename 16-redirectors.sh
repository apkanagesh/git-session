
#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$ (echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
    echo -e "$R please run this script with root priveleges $N" &>>$LOG_FILE
    exit 1
fi 

}

 VALIDATE(){
       if [ $1 -ne 0 ]
       then
           echo -e "command is....$R FAILED $N"  &>>$LOG_FILE
           exit 1
        else
           echo -e "command is....$G success $N" &>>$LOG_FILE
        fi      
 }

  CHECK_ROOT
