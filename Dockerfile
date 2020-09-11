FROM node:10.22.0-buster-slim as build-stage
WORKDIR /app
COPY package*.json yarn.lock /app/
RUN npm install
COPY ./ /app/
RUN npm run build

FROM nginx:1.15
COPY --from=build-stage /app/build/ /usr/share/nginx/html
