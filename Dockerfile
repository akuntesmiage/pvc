# Use the specified Node.js version
FROM node:22

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    imagemagick \
    libjpeg-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgif-dev \
    build-essential \
    g++ \
    webp && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy package.json to the working directory
COPY package.json ./

# Install dependencies
RUN npm install

# Rebuild canvas to ensure it's compatible with the Docker environment
RUN npm rebuild canvas

# Install pm2 globally
RUN npm install pm2 -g

# Copy the rest of the application files
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the application using PM2
CMD ["pm2-runtime", "index.js"]
