# Finyx - Serverless Microservices Platform

## Overview
Finyx is a comprehensive serverless microservices platform built on Azure, designed for scalable document management, user management, and reporting capabilities.

## Architecture
- **Serverless**: Azure Functions for scalable compute
- **Microservices**: Independent services for User Management, Document Management, and Reporting
- **Database**: Azure Cosmos DB for NoSQL data storage
- **Event-driven**: Azure Event Grid and Service Bus for async communication
- **Security**: Azure Active Directory integration with role-based access control
- **Storage**: Azure Blob Storage for document files

## Quick Start
1. Clone the repository
2. Set up Azure resources (see `docs/setup/azure-resources.md`)
3. Configure environment variables (see `docs/setup/environment-setup.md`)
4. Run the setup script: `./scripts/setup.sh`
5. Start development: `./scripts/start-dev.sh`

## Services
- **User Management**: User CRUD operations and authentication
- **Document Management**: File upload, storage, and metadata management
- **Reporting**: Usage analytics and activity reports

## Development
See `docs/development/` for detailed development guides and API documentation.

## Deployment
See `docs/deployment/` for CI/CD pipeline configuration and deployment guides.
