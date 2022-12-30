#!/usr/bin/env bash
if [ -d ".terraform" ]; then
  echo "Removing .terraform..."
  rm -rf .terraform*
fi
terraform init
terraform plan -out tfplan
