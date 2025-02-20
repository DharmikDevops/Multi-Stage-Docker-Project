# Stage 1: Build the application
FROM node:18 AS build

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Stage 2: Create a lightweight image for production
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=build /app .

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
