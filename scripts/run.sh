#!/bin/bash

# Set the directory containing the TypeSpec files
TSP_DIR="./typespec-files"
OUTPUT_DIR="./tsp-generated"  # Single output directory for all files

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
        # Get the base name of the .tsp file without extension
        file_name=$(basename "$file" .tsp)

        echo "Compiling $file..."
        
        # Temporary output directory for this file
        temp_dir="$OUTPUT_DIR/temp/$file_name"
        mkdir -p "$temp_dir"

        # Compile the .tsp file
        tsp compile "$file" --emit @typespec/protobuf --output-dir "$temp_dir"

        # Move and rename generated .proto files to the final output directory
        find "$temp_dir/@typespec/protobuf/resources" -type f -name "*.proto" | while read -r proto_file; do
            new_name="$OUTPUT_DIR/$file_name.proto"
            mv "$proto_file" "$new_name"
        done

        # Cleanup temporary directory
        rm -rf "$temp_dir"

        echo "Generated $file_name.proto"
    fi
done

echo "All TypeSpec files compiled successfully into $OUTPUT_DIR"
