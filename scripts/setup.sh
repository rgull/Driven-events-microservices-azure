#!/bin/bash

# Finyx Setup Script
echo "Setting up Finyx development environment..."

# Check prerequisites
echo "Checking prerequisites..."

# Check .NET 8
if ! command -v dotnet &> /dev/null; then
    echo "Error: .NET 8 SDK is required but not installed."
    exit 1
fi

# Check Azure CLI
if ! command -v az &> /dev/null; then
    echo "Error: Azure CLI is required but not installed."
    exit 1
fi

# Check Azure Functions Core Tools
if ! command -v func &> /dev/null; then
    echo "Error: Azure Functions Core Tools is required but not installed."
    exit 1
fi

echo "Prerequisites check passed!"

# Restore NuGet packages
echo "Restoring NuGet packages..."
dotnet restore

# Build solution
echo "Building solution..."
dotnet build --configuration Release

# Create environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating .env file from template..."
    cp env.example .env
    echo "Please update .env file with your Azure resource details."
fi

# Create local settings for Azure Functions
if [ ! -f Finyx.AzureFunctions/local.settings.json ]; then
    echo "Creating local.settings.json for Azure Functions..."
    cp Finyx.AzureFunctions/local.settings.json.example Finyx.AzureFunctions/local.settings.json
fi

echo "Setup completed successfully!"
echo "Next steps:"
echo "1. Update .env file with your Azure resource details"
echo "2. Update Finyx.AzureFunctions/local.settings.json with your connection strings"
echo "3. Run './scripts/start-dev.sh' to start development"
