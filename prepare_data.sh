#!/bin/bash

#writing CSV headers
echo "date size time" > data/liglab2.csv

#Formatting data and removing incoherent data
sed -e 's/\ bytes.*time=\(.*\) ms/ \1/g' -e 's/\[\(.*\)]/\1/g' data/liglab2.log | grep "^[0-9]*.[0-9]* [0-9]* [0-9]*.[0-9]*$" >> data/liglab2.csv
