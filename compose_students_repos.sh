#!/bin/bash

# Directory containing your repositories
REPO_DIR="../FALL-23/repos"
PORTS_FILE_DESTINATION="../Cygrader2.0/ports.txt"
# Remove existing generated ports file if it exists
rm -f "$PORTS_FILE_DESTINATION"

# Output file for the dynamic docker-compose.yml
OUTPUT_FILE="docker-compose.generated.yml"

# Remove existing generated file if it exists
rm -f "$OUTPUT_FILE"

# Start writing the base docker-compose.yml
echo "version: '3'" >> "$OUTPUT_FILE"
echo "services:" >> "$OUTPUT_FILE"
PORT="8080"

# Loop through each subdirectory in REPO_DIR
for dir in "$REPO_DIR"/*; do
  if [ -d "$dir" ]; then
    # Get the directory name (e.g., repo1, repo2, repo3)
    SERVICE_NAME=$(basename "$dir")
    # Append a service definition to the generated docker-compose.yml
    # Convert to lowercase
    TO_LOWERCASE="${SERVICE_NAME,,}"
    # Remove "initial-setup-" prefix
    RESULT_NAME="${TO_LOWERCASE#initial-setup-}"

    echo "  $RESULT_NAME:" >> "$OUTPUT_FILE"
    echo "    build:" >> "$OUTPUT_FILE"
    echo "      context: ." >> "$OUTPUT_FILE"
    echo "      dockerfile: Dockerfile" >> "$OUTPUT_FILE"
    echo "    ports:" >> "$OUTPUT_FILE"
    echo "      - \"$PORT:80\"" >> "$OUTPUT_FILE"
    echo "    volumes:" >> "$OUTPUT_FILE"
    echo "      - $dir:/usr/share/nginx/html" >> "$OUTPUT_FILE"

    #GENERATES A NAME:PORT FILE TO ITERATE TROUGH
    echo "  $RESULT_NAME: $PORT" >> "$PORTS_FILE_DESTINATION"

    PORT=$((PORT + 1))

  fi
done

# Output the generated docker-compose.yml
cat "$OUTPUT_FILE"
