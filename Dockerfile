FROM node:20.14-bookworm-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY graphserver.js .
COPY package.json .
COPY UScities.json .

RUN npm install

EXPOSE 4000

CMD ["node", "graphserver.js"]
