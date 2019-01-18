# STEP 1 build static website
FROM node:10.15.0-alpine as angular-built
RUN apk update && apk add --no-cache make git

# Set Container app directory
WORKDIR /app

# Install Angular CLI global
RUN npm i -g @angular/cli

# Install app dependencies
COPY package.json .
RUN npm install --silent

# Copy project files into the docker image
COPY . .
RUN ng build --prod --build-optimizer

# STEP 2 build a small nginx image with static website
FROM nginx:alpine
LABEL author="Vincent Leung"

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## Configure Nginx for Angular SPA
COPY nginx.conf /etc/nginx/nginx.conf

## From 'builder' copy website to default nginx public folder
COPY --from=angular-built /app/dist /usr/share/nginx/html

# Support Http and Https
EXPOSE 80 443
CMD [ "nginx", "-g", "daemon off;" ]

# Run command line
# default to Dockerfile at PATH current directory
#docker build --rm -t angular-cli-build:latest .
# Specify filename Dockerfile.debug
#docker build --rm -f Dockerfile.debug -t angular-cli-build:latest .

# Run docker-compose up
