FROM node:current

RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    imagemagick \
    webp && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json ./

RUN yarn install

RUN npm install pm2 -g

COPY . .

EXPOSE 3000

CMD ["pm2-runtime", "main.js"]
