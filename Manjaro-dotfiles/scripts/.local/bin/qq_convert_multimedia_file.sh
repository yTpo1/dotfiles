#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_format>"
    exit 1
fi

# Assign arguments to variables
input_file="$1"
output_format="$2"

# Extract the base name of the input file (without extension)
base_name="${input_file%.*}"

# Construct the output file name
output_file="${base_name}.${output_format}"

# Use ffmpeg to convert the file
ffmpeg -i "$input_file" "$output_file"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
    echo "Conversion successful: $output_file"
else
    echo "Conversion failed."
fi
