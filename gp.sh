#!/bin/bash

###
# Make the script executable by running chmod +x gp.sh
###

read -p "Enter the commit message: " commit_message
git add .
git commit -m "$commit_message"
git push
