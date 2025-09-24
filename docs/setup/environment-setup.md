# Environment Setup

## Local Development

### Prerequisites
- .NET 8 SDK
- Azure Functions Core Tools
- Azure CLI
- Docker (for local Cosmos DB emulator)
- Visual Studio Code with recommended extensions

### Environment Variables
Copy `env.example` to `.env` and configure:

```bash
# Azure Cosmos DB
COSMOS_DB_CONNECTION_STRING="your-connection-string"
COSMOS_DB_DATABASE_NAME="FinyxDev"

# Azure Service Bus
SERVICE_BUS_CONNECTION_STRING="your-connection-string"

# Azure Event Grid
EVENT_GRID_TOPIC_ENDPOINT="your-topic-endpoint"
EVENT_GRID_TOPIC_KEY="your-topic-key"

# Azure AD
AZURE_AD_TENANT_ID="your-tenant-id"
AZURE_AD_CLIENT_ID="your-client-id"
AZURE_AD_CLIENT_SECRET="your-client-secret"

# Azure Storage
AZURE_STORAGE_CONNECTION_STRING="your-storage-connection-string"
```

### Local Services
- Cosmos DB Emulator: `docker run -p 8081:8081 mcr.microsoft.com/cosmosdb/linux/azure-cosmos-emulator`
- Service Bus Emulator: Use Azure Service Bus Explorer

## Production Environment
See `docs/deployment/production-setup.md` for production configuration.
