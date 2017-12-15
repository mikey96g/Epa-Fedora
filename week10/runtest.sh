#!/bin/bash

time_length=5 #Length of time for script to run for


if [ $1 -lt 1 ] || [ $1 -gt 50 ]; then # if statement to check if number of users is in the required restraints
echo "Users must be within a 1 and 50"
else 
     echo -e  "C0 \t N \t idle " >  results.dat #entering headers for .dat file before running loop
	#Run for loop based on how many users that hvae been entered by the parameter
     for (( i=1; i<=$1; i++ ))		
     do
	./loadtest $i & #runs loadtest in the background
	idle=$(mpstat $time_length 1 -o JSON | jq ' .sysstat.hosts[0].statistics[0]."cpu-load"[0].idle') #collect cpu utilisaion by pasring the json format and store in variable called idle
	comp=$(cat synthetic.dat | wc -l) #Retreives the line count from synthetic.dat and stores in comp varible
	

echo -e "$comp \t $i \t $idle" >> results.dat # Move the results into results.dat file.

pkill loadtest #kill loadtest process

done # end loop

fi #end if statement 

