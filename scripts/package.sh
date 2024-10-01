#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Determine the base path based on the environment
if [ "$ENVIRONMENT" = "production" ]; then
  BASE_PATH="/funding-service-data-standards"
else
  BASE_PATH=""
fi

# Export the BASE_PATH variable so it can be used elsewhere
export BASE_PATH

# Compile the site
bundle exec middleman build --build-dir docs --relative-links --verbose

# Create the artifact
tar --dereference --directory docs -cvf artifact.tar --exclude=.git --exclude=.github .

# # Create the gzip archive containing the tar file
# gzip -c artifact.tar > github-pages.tar.gz