#!/bin/bash
# Create a secret with base64 encoded values from macOS, edit the values as needed.
cat <<EOF | oc apply -f -
kind: Secret
apiVersion: v1
metadata:
    name: app-env
data:
    APP_ID: $(echo "123456" | base64)
    CRON_SCHEDULE: $(echo "* 0,15,30,45 * * * *" | base64)
    ENABLE_PR_COMMENT: $(echo "true" | base64)
    WEBHOOK_SECRET: $(echo "secret" | base64)
    PRIVATE_KEY: $(cat ~/Downloads/private-key.pem | base64)
EOF
