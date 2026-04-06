FROM node:20-alpine

RUN apk add --no-cache sqlite

WORKDIR /app

COPY package.json ./
COPY bin ./bin
COPY src ./src

EXPOSE 3847

CMD ["node", "bin/cli.js", "run", "--no-browser", "--port=3847"]
