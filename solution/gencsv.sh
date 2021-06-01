#!/bin/bash
##################################
# Author: Amit Ghosh             #
# Gencsv..
# generates 10 values by default and have options of n
#################################

>inputFile
display_usage() { 
	echo "This script must be run with 1 or zero arguments." 
	echo -e "\nUsage: $0 [arguments] for eg .... $0 or $0 11\n" 
	} 
if [  $# -ge 2 ]
	then
		display_usage
		exit 1
	fi
if [ $# -eq 0 ] ; then
for i in $(seq 0 10); do echo  "$i,$RANDOM" >> inputFile; done
else
for i in $(seq 0 $1); do echo  "$i,$RANDOM" >> inputFile; done
fi
