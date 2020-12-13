#!/bin/bash

# Check SERVER_HOST is set.
if [ -z $SERVER_HOST ]; 
  then echo "SERVER_HOST not set";
  else echo "SERVER_HOST is $SERVER_HOST";
fi;

# get command
# - leetcode
if [ -z "$1" ]
  then
    echo "Usage: SERVER_HOST=<username@host> ./deploy.sh <leetcode|miscellaneous>";
    exit 1;
fi

case $1 in
    leetcode)
        echo "deploy leetcode..."
        mdbook build leetcode
        rsync -azP leetcode/book/* $SERVER_HOST:~/books/leetcode
        ;;
    *)
        echo "Usage: SERVER_HOST=<username@host> ./deploy.sh <leetcode|miscellaneous>"
        ;;
esac
