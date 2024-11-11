# Redirect Service

A lightweight web service using **Nginx** and **Docker** that performs URL-based redirection based on a query parameter. The service supports HTTP/HTTPS redirects and custom protocols (e.g., `mailto:`, `tel:`, `myapp:`). The default error redirect URL can be configured using an environment variable.

## Features

- Redirects users based on the `to` query parameter (e.g., `?to=https://example.com`).
- Configurable error redirect URL via environment variables.
- Simple and portable setup using Docker.

## Prerequisites

- Docker installed (Docker Engine and Docker Compose).

## Project Structure

nd-redirect-tool/  
├── nginx.conf           `# Nginx configuration file`  
├── Dockerfile           `# Dockerfile for building the image`  
└── README.md            `# Project documentation`  

## Configuration

### Environment Variables

The following environment variables can be configured:

- `ERROR_REDIRECT_URL`: The URL to redirect to when the `to` parameter is missing or invalid (default: `https://nd-redirect-tool.com/error`).

You can set this in the `docker-compose.yml` file or pass it when running the container.

## Usage

### Redirect Example

- Access the service with the to parameter:

```bash
curl -v "http://localhost:8080/?to=https://google.com"
```

This will redirect you to <https://google.com>.

- Custom protocol support:

```bash
curl -v "http://localhost:8080/?to=mailto:someone@example.com"
curl -v "http://localhost:8080/?to=myapp://home"
```

### Customizing the Redirect URLs

You can change the default error redirect URL by setting the ERROR_REDIRECT_URL environment variable in docker-compose.yml:

```yaml
environment:
  ERROR_REDIRECT_URL: "https://custom-error-page.com"
```

Or by passing it as an argument when running the Docker container:

```bash
docker run -e ERROR_REDIRECT_URL="https://custom-error-page.com" -p 8080:80 next-depot/nd-redirect-tool
```

## License

This project is licensed under the MIT License.
