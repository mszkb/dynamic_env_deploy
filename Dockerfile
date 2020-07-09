FROM node:12.16.1-alpine3.11 as build-stage

USER node
WORKDIR /home/node

ARG VUE_APP_HARD_1
ARG VUE_APP_HARD_2

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /home/node/dist /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
COPY ./env.sh .
COPY .env .
RUN apk add --no-cache bash
RUN chmod +x env.sh

EXPOSE 80
CMD ["/bin/bash", "-c", "/usr/share/nginx/html/env.sh && nginx -g \"daemon off;\""]
