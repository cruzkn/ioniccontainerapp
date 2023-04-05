FROM node:19.8.1 as build
WORKDIR /app
COPY package*.json /app/
RUN npm install -g ionic
RUN npm install -g cordova
RUN npm install
COPY ./ /app/
RUN npm run-script build
FROM nginx:latest
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/www/ /usr/share/nginx/html/
