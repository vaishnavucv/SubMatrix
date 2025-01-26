#!/bin/bash

# Define the target domain and output files
TARGET_DOMAIN=".nasa.gov"
OUTPUT_FILE="domains.txt"
ALIVE_FILE="alive_domains.txt"

# Fetch data from crt.sh and extract domains
curl -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:118.0) Gecko/20100101 Firefox/118.0" \
    "https://crt.sh/?q=${TARGET_DOMAIN}&output=json" -s | \
    jq -r '.[].name_value' | \
    sed 's/\*.//g' | sort -u > "$OUTPUT_FILE"

# Use httpx to filter active domains
httpx -silent -l "$OUTPUT_FILE" -o "$ALIVE_FILE"

# Print the result
echo "Fetched domains saved to $OUTPUT_FILE"
echo "Active domains saved to $ALIVE_FILE"
