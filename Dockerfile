FROM node:20.14-bookworm-slim

RUN apt-get update && \
    apt-get install -y --only-upgrade git=1:2.20.1-2+deb10u9 git-man=1:2.20.1-2+deb10u9 && \
    apt-get install -y --only-upgrade zlib1g=1:1.2.11.dfsg-1+deb10u5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY graphserver.js .
COPY package.json .
COPY UScities.json .

RUN npm install

EXPOSE 4000

CMD ["node", "graphserver.js"]
