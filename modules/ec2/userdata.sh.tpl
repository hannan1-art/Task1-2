#!/bin/bash
set -e

# Update system
dnf update -y

# Install Docker
dnf install -y docker

# Enable and start Docker
systemctl enable docker
systemctl start docker

# Create application directory
mkdir -p /opt/app

# Create sample Node.js application
cat > /opt/app/app.js <<EOF
const http = require("http");

const PORT = ${app_port};

http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "application/json" });
  res.end(JSON.stringify({
    status: "ok",
    message: "Node.js app running on Docker-enabled EC2"
  }));
}).listen(PORT);
EOF

# Run Node.js application in Docker
docker run -d \
  --name node-app \
  --restart unless-stopped \
  -v /opt/app:/opt/app \
  -p ${app_port}:${app_port} \
  node:20-alpine \
  node /opt/app/app.js