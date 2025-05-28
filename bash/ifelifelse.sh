#!/bin/bash

if [ ${1,,} = herbert]; then
   echo "Oh, you're him. welcome!"
elif [ ${1,,} = help]; then
   echo "Just enter your username, duh!"
else 
   echo "I dont' know who you are"
fi