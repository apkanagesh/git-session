#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
then
    echo "please run this script with root priveleges"
    exit 1
fi 

}

 VALIDATE(){
       if [ $1 -ne 0 ]
       then
           echo -e "command is....$R FAILED $N"
           exit 1
        else
           echo -e "command is....$G success $N"
        fi      
 }

  CHECK_ROOT

dnf list installed git


if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y

    VALIDATE $? "Installing git"
  
else    
    echo "Git is already installed, nothing to do.."
fi   

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed...going to install"
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
       echo "MYSQL is already installed..nothing to do"
  fi  