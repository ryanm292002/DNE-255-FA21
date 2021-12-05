#!/bin/bash

#Script for parsing /etc/passwd

#root:x:0:0:root:/root:/bin/bash

#Create a prompt that requests the location of the file
read -p "Please enter the log file name: " PASSWD

#Username User ID Group ID Comment Home directory Default Shell

awk -F: ' BEGIN { format = "%-20s %-8s %-8s %-25s %s\n"
	printf format, "Username", "UserID", "GroupID", "Home directory", "Default Shell"
	printf format, "--------", "------", "-------", "--------------", "------------" }
	{ printf format, $1, $3, $4, $6, $7 }
' ${PASSWD}
