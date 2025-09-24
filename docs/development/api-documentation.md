# API Documentation

## User Management API

### Base URL
- Development: `https://localhost:7001`
- Production: `https://finyx-users.azurewebsites.net`

### Endpoints

#### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `POST /api/auth/refresh` - Refresh token
- `POST /api/auth/logout` - User logout

#### Users
- `GET /api/users` - Get all users (Admin only)
- `GET /api/users/{id}` - Get user by ID
- `PUT /api/users/{id}` - Update user
- `DELETE /api/users/{id}` - Delete user (Admin only)

## Document Management API

### Base URL
- Development: `https://localhost:7002`
- Production: `https://finyx-documents.azurewebsites.net`

### Endpoints

#### Documents
- `POST /api/documents/upload` - Upload document
- `GET /api/documents/{id}` - Get document metadata
- `GET /api/documents/{id}/download` - Download document
- `DELETE /api/documents/{id}` - Delete document
- `GET /api/documents` - List user documents

## Reporting API

### Base URL
- Development: `https://localhost:7003`
- Production: `https://finyx-reports.azurewebsites.net`

### Endpoints

#### Reports
- `GET /api/reports/usage` - Generate usage report
- `GET /api/reports/activity` - Generate activity report
- `GET /api/reports/analytics` - Get analytics data

## Authentication
All APIs use JWT Bearer tokens. Include the token in the Authorization header:
```
Authorization: Bearer <your-jwt-token>
```

## Error Handling
All APIs return standard HTTP status codes and error responses in the format:
```json
{
  "error": "Error message",
  "details": "Additional error details"
}
```
