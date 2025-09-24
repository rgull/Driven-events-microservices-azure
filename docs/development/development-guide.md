# Development Guide

## Project Structure
```
Finyx/
├── Finyx.AzureFunctions/          # Serverless functions
├── services/                      # Microservices
│   ├── UserManagement/
│   ├── DocumentManagement/
│   └── Reporting/
├── Finyx.Shared/                  # Shared libraries
├── Finyx.Core/                    # Business logic
├── docs/                          # Documentation
├── scripts/                       # Setup and deployment scripts
└── .github/                       # CI/CD workflows
```

## Clean Architecture Principles
- **Domain Layer**: Core business entities and interfaces
- **Application Layer**: Use cases and business logic
- **Infrastructure Layer**: External services and data access
- **Presentation Layer**: Controllers and DTOs

## Development Workflow
1. Create feature branch from `main`
2. Implement changes following clean architecture
3. Write unit tests
4. Run integration tests
5. Create pull request
6. Code review and merge

## Testing
- Unit tests: `dotnet test`
- Integration tests: `dotnet test --filter Category=Integration`
- Load tests: Use Azure Load Testing

## Code Standards
- Follow C# naming conventions
- Use dependency injection
- Implement proper error handling
- Add comprehensive logging
- Write meaningful tests

## VS Code Extensions
- C# for Visual Studio Code
- Azure Functions
- Azure Account
- Cosmos DB
- REST Client
- Thunder Client
