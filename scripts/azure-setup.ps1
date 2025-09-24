# Azure Resources Setup Script
# This script creates all required Azure resources for Finyx

param(
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName,
    
    [Parameter(Mandatory=$true)]
    [string]$Location = "East US",
    
    [Parameter(Mandatory=$true)]
    [string]$Environment = "dev"
)

$prefix = "finyx-$Environment"

Write-Host "Creating Azure resources for Finyx..." -ForegroundColor Green

# Create Resource Group
Write-Host "Creating Resource Group: $ResourceGroupName" -ForegroundColor Yellow
az group create --name $ResourceGroupName --location $Location

# Create Cosmos DB Account
Write-Host "Creating Cosmos DB Account: $prefix-cosmos" -ForegroundColor Yellow
az cosmosdb create --name "$prefix-cosmos" --resource-group $ResourceGroupName --kind GlobalDocumentDB

# Create Service Bus Namespace
Write-Host "Creating Service Bus Namespace: $prefix-sb" -ForegroundColor Yellow
az servicebus namespace create --name "$prefix-sb" --resource-group $ResourceGroupName --location $Location

# Create Storage Account
Write-Host "Creating Storage Account: $prefix-storage" -ForegroundColor Yellow
az storage account create --name "$prefix-storage" --resource-group $ResourceGroupName --location $Location --sku Standard_LRS

# Create Key Vault
Write-Host "Creating Key Vault: $prefix-kv" -ForegroundColor Yellow
az keyvault create --name "$prefix-kv" --resource-group $ResourceGroupName --location $Location

# Create Function App
Write-Host "Creating Function App: $prefix-functions" -ForegroundColor Yellow
az functionapp create --name "$prefix-functions" --resource-group $ResourceGroupName --storage-account "$prefix-storage" --runtime dotnet-isolated --runtime-version 8.0

# Create App Services for Microservices
Write-Host "Creating App Services for Microservices..." -ForegroundColor Yellow
az webapp create --name "$prefix-users" --resource-group $ResourceGroupName --plan "$prefix-plan" --runtime "DOTNET|8.0"
az webapp create --name "$prefix-documents" --resource-group $ResourceGroupName --plan "$prefix-plan" --runtime "DOTNET|8.0"
az webapp create --name "$prefix-reports" --resource-group $ResourceGroupName --plan "$prefix-plan" --runtime "DOTNET|8.0"

Write-Host "Azure resources created successfully!" -ForegroundColor Green
Write-Host "Please configure the following in your environment:" -ForegroundColor Cyan
Write-Host "1. Cosmos DB connection string"
Write-Host "2. Service Bus connection string"
Write-Host "3. Storage account connection string"
Write-Host "4. Key Vault secrets"
Write-Host "5. Azure AD app registration"
