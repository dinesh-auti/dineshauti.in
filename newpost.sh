#!/bin/bash

# Usage: ./newpost.sh "Post Title" [--kind til]
# Default kind
kind="default"

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --kind) kind="$2"; shift ;;
        *) title="$1" ;;
    esac
    shift
done

# Validate input
if [ -z "$title" ]; then
    echo "❌ Error: Please provide a post title."
    echo "✅ Usage: ./newpost.sh \"My Post Title\" [--kind til]"
    exit 1
fi

# Generate slug and path
today=$(date +"%y%m%d")
slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')

if [ $kind = "til" ]; then
    path="til/${today}-${slug}"
else
    path="posts/${today}-${slug}"
fi

# Create new post with correct archetype
echo "📄 Creating post: $path (kind: $kind)"
hugo new --kind "$kind" "$path/index.md"