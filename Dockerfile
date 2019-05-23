FROM node:10-alpine

### App configs
ARG port=8080
ENV PORT     ${port}

### Security
ARG origins=*
ENV ORIGINS ${origins}

### NODE ENV
ENV NODE_OPTIONS --max-old-space-size=500
ENV NPM_CONFIG_LOGLEVEL warn

### Create app directory
RUN mkdir -p /usr/src/app
ADD ./package.json /usr/src/app/package.json
ADD ./index.js     /usr/src/app/index.js

WORKDIR /usr/src/app

### Install dependecies
RUN npm install --production

EXPOSE ${port}
CMD [ "npm", "start" ]
