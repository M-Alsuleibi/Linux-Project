#!/bin/bash

# Set the destination directory
dest_dir="/home/mohammad/Desktop/LinuxP"

# Get current timestamp
timestamp=$(date +"%Y-%m-%dT%H-%M")

# Define file names
log_file="kernel-logs-$timestamp.txt"
compressed_file="kernel-logs-$timestamp.tar.bz2"

# Collect kernel logs for the last hour
journalctl --since "1 hour ago" > "$dest_dir/$log_file"

# Compress the log file
tar -cvjf "$dest_dir/$compressed_file" -C "$dest_dir" "$log_file"

# Remove the original log file
rm "$dest_dir/$log_file"

# Upload the compressed file to Dropbox
dbxcli put "$dest_dir/$compressed_file" "/Dropbox/Folder/"

# Clean up compressed file
rm "$dest_dir/$compressed_file"

