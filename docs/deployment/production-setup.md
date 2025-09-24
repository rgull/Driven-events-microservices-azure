# Production Deployment Guide

## Prerequisites
- Azure subscription with appropriate permissions
- Azure CLI installed and configured
- GitHub repository with secrets configured

## Environment Configuration

### 1. Azure Resources
Run the PowerShell script to create all required Azure resources:
```powershell
./scripts/azure-setup.ps1 -ResourceGroupName "finyx-prod" -Location "East US" -Environment "prod"
```

### 2. Application Settings
Configure the following in Azure App Services and Function Apps:

#### Azure Functions
- `CosmosDBConnectionString`: Cosmos DB connection string
- `ServiceBusConnectionString`: Service Bus connection string
- `EventGridTopicEndpoint`: Event Grid topic endpoint
- `EventGridTopicKey`: Event Grid topic key
- `AzureAd:TenantId`: Azure AD tenant ID
- `AzureAd:ClientId`: Azure AD client ID
- `AzureAd:ClientSecret`: Azure AD client secret

#### App Services (Microservices)
- Same configuration as Azure Functions
- Additional service-specific settings

### 3. Security Configuration
- Configure Azure AD app registrations
- Set up managed identities
- Configure Key Vault access policies
- Set up SSL certificates

### 4. Monitoring
- Configure Application Insights
- Set up Azure Monitor alerts
- Configure log analytics

## CI/CD Pipeline
The GitHub Actions workflow will automatically:
1. Build and test the solution
2. Deploy to staging environment
3. Run integration tests
4. Deploy to production (on main branch)

## Health Checks
- Configure health check endpoints
- Set up monitoring dashboards
- Configure alerting rules

## Backup and Recovery
- Configure Cosmos DB backup policies
- Set up storage account backup
- Document recovery procedures
