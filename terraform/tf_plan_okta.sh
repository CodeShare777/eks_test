#!/usr/bin/env bash
if [ -d ".terraform" ]; then
  echo "Removing .terraform..."
  rm -rf .terraform*
fi
terraform init -backend-config="bucket=terraform-test-101"
terraform plan -out tfplan
