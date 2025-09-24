# Azure Resources Setup

## Required Azure Resources

### 1. Azure Functions
- Create Function App with .NET 8 runtime
- Configure Application Insights
- Set up managed identity

### 2. Azure Cosmos DB
- Create Cosmos DB account
- Create databases: FinyxUsers, FinyxDocuments, FinyxReports
- Create containers with appropriate partition keys

### 3. Azure Service Bus
- Create Service Bus namespace
- Create queues: user-events, document-events, reporting-events

### 4. Azure Event Grid
- Create Event Grid topic
- Configure event subscriptions

### 5. Azure Active Directory
- Register application
- Configure API permissions
- Set up app roles (Admin, Developer, User)

### 6. Azure Blob Storage
- Create storage account
- Create container for documents

### 7. Azure Key Vault
- Create Key Vault
- Store connection strings and secrets

## Resource Configuration
See `scripts/azure-setup.ps1` for automated resource creation.
