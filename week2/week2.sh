#!/bin/bash

echo "Creating new file called 'week_2_file'" && \
touch ../week1/temp/week_2_file

echo "Changing file permissions to 666" && \
sudo chmod 666 ../week1/temp/week_2_file

echo "Changing file owner to root" && \
sudo chown root ../week1/temp/week_2_file

echo "Printing file's permissions and ownership" && \
ls -l ../week1/temp/week_2_file

echo "Printing size of current directory" && \
du -sh

echo "Printing amount of free space on all disks" && \
df -h

echo "Script completed"
