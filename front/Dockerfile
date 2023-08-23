FROM node:latest

COPY .env ./
RUN export $(cat .env | xargs) && rm -rf .env

RUN mkdir -p /var

COPY ./app /var/app

WORKDIR /var/app

RUN npm install -g npm-check-updates && \
  ncu -u && \
  npm install --force && npm run build

EXPOSE 3000 

ENTRYPOINT ["npm", "start"] 