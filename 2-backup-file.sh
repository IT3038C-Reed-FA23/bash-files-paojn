#!/bin/bash

# Prompt the user to enter a file name or path
read -p "Enter a file name or path: " filename

# Check if the specified file exists
if [ -f "$filename" ]; then
  # Get the current date and time
  current_date=$(date +'%Y-%m-%d') # in the format YYYY-MM-DD
  current_time=$(date +'%H-%M-%S') # in the format HH-MM-SS

  # Create the backup file name by appending the current date and time
  # Be sure to add the date and time between the file name and extension (ex. README_2020-01-01_12-00-00.md)
  extension="${filename##*.}"
  filename_noext="${filename%.*}"
  backup_filename="${filename_noext}_${current_date}_${current_time}.$extension"

  # Copy the original file to the backup file
  cp "$filename" "$backup_filename"

  # Compress the backup file using tar
  tar -czvf "${backup_filename}.tar.gz" "$backup_filename"

  # Remove the uncompressed backup file
  rm "$backup_filename"

  echo "Backup file '${backup_filename}.tar.gz' created and compressed successfully."
else
  echo "Error: File '$filename' does not exist."
fi
