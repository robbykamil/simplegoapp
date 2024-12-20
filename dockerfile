# Use the official Go image to build the app
FROM golang:1.21 AS builder

# Set the working directory
WORKDIR /app

# Copy Go modules files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code
COPY . .

# Build the application
RUN go build -o myapp

# Use a minimal base image to run the app
FROM debian:bullseye-slim

# Copy the built binary from the builder stage
COPY --from=builder /app/myapp /usr/local/bin/myapp

# Set environment variable for the port
ENV PORT=8080

# Expose the port
EXPOSE 8080

# Run the application
ENTRYPOINT ["myapp"]
