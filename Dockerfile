# Base Image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy application source code
COPY . .

# Environment variables
ENV PORT=3000

# Expose port
EXPOSE 3000

# Start command (exec form)
CMD ["node", "server.js"]
