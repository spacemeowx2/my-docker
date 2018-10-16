FROM node:8-alpine
COPY . /app
RUN cd /app \
    && npm install

EXPOSE 8098
EXPOSE 1935

CMD [ "node", "/app/index.js" ]
