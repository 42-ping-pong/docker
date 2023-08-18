FROM node

RUN mkdir -p /var

COPY ./app /var/app

WORKDIR /var/app

RUN npm install --force && npm run build

EXPOSE 4000

ENTRYPOINT [ "node", "dist/main.js" ]