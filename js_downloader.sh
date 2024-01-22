#!/bin/bash

# Define the file containing the list of JavaScript links
input_file="js_links.txt"

# Define the output file for storing the downloaded JavaScript content
output_file="downloaded_js_files.txt"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file $input_file not found."
    exit 1
fi

# Remove the existing output file if it exists
[ -e "$output_file" ] && rm "$output_file"

# Loop through each line in the input file and download the JavaScript content
while IFS= read -r js_link; do
    echo "Downloading: $js_link"
    wget -q -O - "$js_link" >> "$output_file"
done < "$input_file"

echo "Downloaded JavaScript content saved to $output_file"
