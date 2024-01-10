FROM node:20.1.0-alpine
WORKDIR /usr/src/app
COPY . .
RUN npm install
EXPOSE 8081
CMD ["node", "index.js"]
