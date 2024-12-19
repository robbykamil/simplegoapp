# Use the official Golang image as a base
FROM golang:1.20

# Set the working directory
WORKDIR /app

# Copy the Go modules and source code
COPY go.mod go.sum ./
RUN go mod download
COPY . .

# Build the application
RUN go build -o myapp .

# Expose the port
EXPOSE 8080

# Run the application
CMD ["./myapp"]
