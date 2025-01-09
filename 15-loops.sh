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
  #sh 15-loops.sh git mysql postfix nginx
  for package in $@ #@ refers to al arguments passed to it
  do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "package is not installed,going to install it.."
        dnf install $package -y
        VALIDATE $? "Installing $package"
     else
         echo "$package is already installed..nothing to do"
      fi
    done        
