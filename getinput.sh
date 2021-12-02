#!/usr/bin/env bash
year=2021

if [[ $# -gt 2 ]]; then
		echo "Usage: $0 [day of week]"
		exit -1;
fi

day=$(date +%-d)
if [[ $# -gt 0 ]]; then
		day=$1
fi

curl --silent --output input/$day.txt "https://adventofcode.com/$year/day/$day/input" --cookie cookies

echo "Input saved as input/$day.txt"
echo "============================="
echo ""
head -n 5 input/$day.txt
