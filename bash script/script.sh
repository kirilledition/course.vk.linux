#! /usr/bin/env bash

lineslimit=10

filename=$3
nlines=$(wc -l < $filename)

if ! [ $3 ]; then 
    echo "ERROR: Parameters not specified" 1>&2
    echo "USAGE: script.sh <search pattern> <include|exclude> <filelist>"
    exit 1 
elif [ $(wc -l < $filename) -gt $lineslimit ]; then
    echo "ERROR: Too many strings in $filename, it must be less then $lineslimit" 1>&2
    echo "USAGE: script.sh <search pattern> <include|exclude> <filelist>"
    exit 1
fi

if [ $2 == "include" ]; then
    GREP='grep '$1''
elif [ $2 == "exclude" ]; then
    GREP='grep -v '$1''
else
    echo "ERROR: include or exclude, not $2" 1>&2
    echo "USAGE: script.sh <search pattern> <include|exclude> <filelist>"
    exit 1 
fi

lines=$(cat $3)
for line in $lines
do
    eval $GREP $line 
done
