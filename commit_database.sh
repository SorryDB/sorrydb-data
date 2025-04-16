#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Function to handle errors
handle_error() {
  echo "Error: $1"
  exit 1
}

# Change to the repository directory
if ! cd /home/austin/development/lean/sorry-index/sorry-db-data; then
  handle_error "Failed to change to repository directory"
fi

# Get current timestamp
CURRENT_TIME=$(date "+%Y-%m-%d_%H:%M:%S")
LOG_FILE="${CURRENT_TIME}_logs"

echo "Updating database..."
# Run the Docker container with the mounted volume to update databse
docker run \
  --memory=10g \
  --memory-swap=10g \
  --mount type=bind,source=/home/austin/development/lean/sorry-index/sorry-db-data,target=/data \
  sorrydb:latest \
  sh -c "poetry run update_db --database-file /data/sorry_database.json --stats-file /data/update_database_stats.json --log-file \"/data/logs/${LOG_FILE}\" \
    && poetry run deduplicate_db --database-file /data/sorry_database.json --results-file /data/deduplicated_sorries.json --log-file \"/data/logs/${LOG_FILE}\""

# Get current timestamp
CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")

echo "Staging changes..."
# Add all changes
if ! git add .; then
  handle_error "Failed to stage changes"
fi

# Check if there are changes to commit
if ! git diff --staged --quiet; then
  echo "Committing changes..."
  # Commit with timestamp in message
  if ! git commit -m "Updating SorryDB at ${CURRENT_TIME}"; then
    handle_error "Failed to commit changes"
  fi

  echo "Creating tag with today's date..."
  # Create a tag with today's date
  TAG_DATE=$(date "+%Y-%m-%d")
  if ! git tag -a "${TAG_DATE}" -m "Database update on ${CURRENT_TIME}"; then
    handle_error "Failed to create tag"
  fi

  echo "Pushing changes and tags..."
  # Push changes
  if ! git push; then
    handle_error "Failed to push changes"
  fi
  
  # Push tags
  if ! git push --tags; then
    handle_error "Failed to push tags"
  fi
  
  echo "Successfully updated, committed, tagged, and pushed changes"
else
  echo "No changes to commit"
fi

