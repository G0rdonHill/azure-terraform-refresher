#!/bin/bash

# Set the Azure Subscription ID
SUBSCRIPTION_ID="$(az account show --query id --output tsv)"

# Set the name for the new service principal
SP_NAME="terraform-cloud-sp"

# Create the service principal and capture the output
SP_JSON=$(az ad sp create-for-rbac --name "$SP_NAME" --role Contributor --scopes /subscriptions/"$SUBSCRIPTION_ID")

# Parse output to get the values needed for Terraform Cloud
APP_ID=$(echo $SP_JSON | jq -r .appId)
PASSWORD=$(echo $SP_JSON | jq -r .password)
TENANT_ID=$(echo $SP_JSON | jq -r .tenant)

# Output the credentials
echo "ARM_CLIENT_ID: $APP_ID"
echo "ARM_CLIENT_SECRET: $PASSWORD"
echo "ARM_SUBSCRIPTION_ID: $SUBSCRIPTION_ID"
echo "ARM_TENANT_ID: $TENANT_ID"

# Output instructions for setting up Terraform Cloud
echo "Copy and paste the above credentials into your Terraform Cloud workspace environment variables."
