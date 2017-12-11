#!/bin/bash
time_length=5




if [ $1 -lt 1 ] || [ $1 -gt 50 ]; then
echo "Users must be within a 1 and 50"
else 
     echo -e  "C0 \t N \t idle " >  results.dat
     for (( i=1; i<=5; i++ ))
     do
	./loadtest $i &
	idle=$(mpstat $time_length 1 -o JSON | jq ' .sysstat.hosts[0].statistics[0]."cpu-load"[0].idle')
	comp=$(cat synthetic.dat | wc -l)
	echo "hello"

echo -e "$comp \t $i \t $idle" >> results.dat

pkill loadtest

done

fi 

