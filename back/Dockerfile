FROM node:latest

RUN mkdir -p /var

COPY ./app /var/app

WORKDIR /var/app

RUN npm install -g npm-check-updates && \
  ncu -u && \
  npm install --force && npm run build

EXPOSE 4000

ENTRYPOINT [ "node", "dist/main.js" ]