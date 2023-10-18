#!/bin/bash

# Prompt the user to enter a directory path
read -p "Please enter a directory path: " directory

# Check if the directory exists

  # If
if [ -d "$directory" ]; then
  echo "Directory exists. Listing files and subdirectories:"

  # List all files and subdirectories in the specified directory
  ls "$directory"

# else the directory does not exist
else
  echo "Error: Directory does not exist."
fi