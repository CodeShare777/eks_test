#!/usr/bin/env bash
if [ -d ".terraform" ]; then
  echo "Removing .terraform..."
  rm -rf .terraform*
fi
terraform init -backend-config="bucket=farid-test-eks"
terraform plan -out tfplan
