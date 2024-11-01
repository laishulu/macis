#!/bin/bash

# Get the most recent tag
TAG=$1

# Remove 'v' prefix if present
VERSION=$(echo "$TAG" | sed 's/^v//')

echo $VERSION > VERSION

# Stage the changed files
git add VERSION

# Commit the changes
git commit -m "Bump version to $VERSION"

# Amend the tag to include this new commit
git tag -f "$TAG"

echo "Updated Homebrew formula to version $VERSION"
