# Gunakan image dasar node:20
FROM node:20

# Update dan instal dependencies yang dibutuhkan
RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    imagemagick \
    webp && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# Atur direktori kerja
WORKDIR /app

# Salin package.json ke direktori kerja
COPY package.json ./

# Instal dependensi menggunakan npm
RUN npm install

# Instal pm2 secara global
RUN npm install pm2 -g

# Salin semua file aplikasi ke direktori kerja
COPY . .

# Ekspos port 3000
EXPOSE 3000

# Mulai aplikasi menggunakan PM2
CMD ["pm2-runtime", "start", "index.js"]
