FROM node:8-alpine

COPY package.json /app/package.json
RUN cd /app \
    && npm install
COPY . /app

EXPOSE 8098
EXPOSE 1935

CMD [ "node", "/app/index.js" ]
