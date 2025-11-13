#!/bin/bash
# Simple deploy script (example). Replace variables and configure SSH key path.
# Usage: ./deploy.sh APP_IP /path/to/artifact

APP_IP="$1"
ARTIFACT_PATH="$2"
SSH_KEY="/var/jenkins_home/.ssh/deploy_key"

if [ -z "$APP_IP" ] || [ -z "$ARTIFACT_PATH" ]; then
  echo "Usage: $0 APP_IP ARTIFACT_PATH"
  exit 1
fi

echo "Copying artifact to ${APP_IP}..."
scp -i "${SSH_KEY}" -o StrictHostKeyChecking=no "$ARTIFACT_PATH" ubuntu@"${APP_IP}":/home/ubuntu/app/

echo "Restarting myapp service..."
ssh -i "${SSH_KEY}" -o StrictHostKeyChecking=no ubuntu@"${APP_IP}" 'sudo systemctl daemon-reload || true; sudo systemctl restart myapp || true'

echo "Deploy finished."
