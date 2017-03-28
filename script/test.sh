#!/bin/bash
# Script to compile and execute a c program in one step.
file_name=$1
if [[ $file_name == *.c ]]; then
	# Get file name without the .c extension
	file_name=$(echo $1|sed 's/\(.*\)\.c/\1/')

	# Compile the program with -o option to specify the name of the binary
	gcc -o $file_name.out $1

	# If there were no compilation errors, run the program
	if [[ $? -eq 0 ]]; then
		./$file_name.out
	fi
elif [[ $file_name == *.cpp ]]; then
	# Get file name without the .c extension
	file_name=$(echo $1|sed 's/\(.*\)\.cpp/\1/')

	# Compile the program with -o option to specify the name of the binary
	g++ -o $file_name.out $1

	# If there were no compilation errors, run the program
	if [[ $? -eq 0 ]]; then
		./$file_name.out
	fi

elif [[ $file_name == *.py ]]; then
	file_name=$(echo $1|sed 's/\(.*\)\.py/\1/')
	python $file_name.py

elif [[ $file_name == *.rb ]]; then
	file_name=$(echo $1|sed 's/\(.*\)\.rb/\1/')
	ruby $file_name.rb

elif [[ $file_name == *.java ]]; then
	file_name=$(echo $1|sed 's/\(.*\)\.java/\1/')
	javac $file_name.java
	java $file_name
fi
