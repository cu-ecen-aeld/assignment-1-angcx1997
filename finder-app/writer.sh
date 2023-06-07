#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 [WRITEFILE] [WRITE_STR]"
   echo -e "\t[WRITEFILE] Full path to a file (including filename) on the filesystem"
   echo -e "\t[WRITE_STR] Text string which will be written within WRITEFILE"
   echo "Return: 0 if success, otherwise error return 1"
   exit 1 # Exit script after printing help
}

# Check number of argument. If arguemnt less than 2 return 1
if [[ $# -ne 2 ]]
then
   echo "Some or all of the arguments are missing"
   helpFunction
   exit 1
fi

dir=$1
str=$2

mkdir -p "$(dirname $dir)"
if [ $? -ne 0 ] ; then
    echo Fail to create $dir
    exit 1
fi


# touch $dir

echo $str >> $dir

exit 0