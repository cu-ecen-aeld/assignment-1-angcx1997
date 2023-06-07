#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 [FILESDIR] [SEARCH_STR]"
   echo -e "\t[FILESDIR] Path to a directory on the filesystem"
   echo -e "\t[SEARCH_STR] text string which will be searched within files in FILESDIR"
   echo "Return: 0 if success, otherwise error return 1"
   exit 1 # Exit script after printing help
}

# Check number of argument. If arguemnt less than 2 return 1
if [[ $# -ne 2 ]]
then
   echo "Some or all of the arguments are missing"
   helpFunction
   exit 1
# Check if the directory exist
elif [[ ! -d $1 ]]
then
    echo $1 does not represent a directory on the filesystem
    exit 1
fi

dir=$1
str=$2

# If you want to count only files and not include the directories.
file_count=$(find $dir -type f | wc -l)
matching_line=$(grep -r $str $dir | wc -l)
echo The number of files are $file_count and the number of matching lines are $matching_line
# echo The number of matching line are $matching_line_count
# echo The matching line content:
# echo $matching_line