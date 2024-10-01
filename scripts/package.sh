#!/bin/bash

# Compile the site
bundle exec middleman build --build-dir docs --verbose

# Create the artifact
tar --dereference --directory docs -cvf artifact.tar --exclude=.git --exclude=.github .