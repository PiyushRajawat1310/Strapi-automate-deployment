FROM node:20-slim

# Install required dependencies for sqlite
RUN apt-get update && apt-get install -y \
    python3 \
    build-essential \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of project
COPY . .

# Expose Strapi port
EXPOSE 1337

# Start Strapi directly
CMD ["npm", "run", "develop"]
