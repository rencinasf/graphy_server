FROM node:20.14-bookworm-slim

# Update the package list and upgrade git and git-man to the recommended versions
RUN apt-get update && \
    apt-get install -y --only-upgrade git=1:2.20.1-2+deb10u9 git-man=1:2.20.1-2+deb10u9 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY graphserver.js .
COPY package.json .
COPY UScities.json .

RUN npm install

EXPOSE 4000

CMD ["node", "graphserver.js"]
