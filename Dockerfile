# Base image
FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install --production

# Copy all app files
COPY . .

# Install Redis
RUN apk add --no-cache redis

# Expose port
EXPOSE 3000

# Start Redis in background & backend
CMD redis-server --daemonize yes && npm run start:prod
