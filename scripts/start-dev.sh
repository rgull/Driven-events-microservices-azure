#!/bin/bash

# Finyx Development Startup Script
echo "Starting Finyx development environment..."

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
    echo "Environment variables loaded from .env"
else
    echo "Warning: .env file not found. Using default values."
fi

# Start Cosmos DB Emulator (if Docker is available)
if command -v docker &> /dev/null; then
    echo "Starting Cosmos DB Emulator..."
    docker run -d -p 8081:8081 --name cosmos-emulator mcr.microsoft.com/cosmosdb/linux/azure-cosmos-emulator
    sleep 10
else
    echo "Docker not available. Please start Cosmos DB Emulator manually."
fi

# Start Azure Functions
echo "Starting Azure Functions..."
cd Finyx.AzureFunctions
func start --port 7071 &
FUNCTIONS_PID=$!

# Start User Management Service
echo "Starting User Management Service..."
cd ../services/UserManagement
dotnet run --urls="https://localhost:7001" &
USER_PID=$!

# Start Document Management Service
echo "Starting Document Management Service..."
cd ../DocumentManagement
dotnet run --urls="https://localhost:7002" &
DOCUMENT_PID=$!

# Start Reporting Service
echo "Starting Reporting Service..."
cd ../Reporting
dotnet run --urls="https://localhost:7003" &
REPORTING_PID=$!

echo "All services started!"
echo "Services running on:"
echo "- Azure Functions: https://localhost:7071"
echo "- User Management: https://localhost:7001"
echo "- Document Management: https://localhost:7002"
echo "- Reporting: https://localhost:7003"

# Wait for user input to stop services
echo "Press Ctrl+C to stop all services..."
trap 'echo "Stopping services..."; kill $FUNCTIONS_PID $USER_PID $DOCUMENT_PID $REPORTING_PID; docker stop cosmos-emulator; docker rm cosmos-emulator; exit' INT
wait
