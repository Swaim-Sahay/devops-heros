#!/bin/bash

CURRENT_DATE=$(date)
HOST_NAME=$(hostname)
USER_NAME=$(whoami)

echo "Current Date : $CURRENT_DATE"
echo "Hostname     : $HOST_NAME"
echo "Username     : $USER_NAME"
echo ""

echo "--- Disk Usage ---"
df -h
echo ""

read -p "Enter a name for the new directory to store process logs: " DIR_NAME

echo "Creating directory '$DIR_NAME'..."
mkdir -p "$DIR_NAME"

FILE_PATH="$DIR_NAME/running_processes.txt"

echo "Creating file '$FILE_PATH'..."
touch "$FILE_PATH"

echo "Fetching running processes and saving to $FILE_PATH..."
ps aux > "$FILE_PATH"

echo "Success! Process list has been saved."
echo "You can view it using: cat $FILE_PATH"