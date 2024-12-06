#!/bin/bash

# Set the directory containing the TypeSpec files
TSP_DIR="./typespec-files" 
OUTPUT_DIR="./tsp-output"

# Ensure TypeSpec CLI is installed
if ! command -v tsp &> /dev/null; then
    echo "Error: TypeSpec CLI is not installed. Install it with 'npm install -g @typespec/compiler'."
    exit 1
fi

# Ensure the TypeSpec output directory exists
mkdir -p "$OUTPUT_DIR"

# Compile all .tsp files in the TSP_DIR
for file in "$TSP_DIR"/*.tsp; do
    if [ -f "$file" ]; then
        echo "Compiling $file..."
        tsp compile $file --emit @typespec/protobuf
        if [ $? -ne 0 ]; then
            echo "Error: Failed to compile $file"
            exit 1
        fi
    fi
done

echo "All TypeSpec files compiled successfully into $OUTPUT_DIR"
