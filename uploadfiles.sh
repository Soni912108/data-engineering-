#!/bin/bash

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}')
fi

# Check if required variables are set
if [ -z "$SSH_KEY" ] || [ -z "$REMOTE_USER" ] || [ -z "$REMOTE_IP" ]; then
    echo "Error: Missing required environment variables"
    exit 1
fi

# Execute SCP command
scp -i "$SSH_KEY" -r "$LOCAL_PATH_UPLOAD"/* "$REMOTE_USER@$REMOTE_IP:$REMOTE_PATH_UPLOAD"