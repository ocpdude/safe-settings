FROM --platform=linux/amd64 node:21.6.0-alpine3.19
WORKDIR /opt/safe-settings
ENV NODE_ENV production
## Set the Labels
LABEL version="1.0" \
      description="Probot app which is a modified version of Settings Probot GitHub App" \
      maintainer="OCPdude <ocpdudes@gmail.com>" \
      org.opencontainers.image.source="https://github.com/ocpdude/safe-settings"

## These files are copied separately to allow updates
## to the image to be as small as possible
COPY  package.json /opt/safe-settings/
COPY  index.js /opt/safe-settings/
COPY  lib /opt/safe-settings/lib

## Update packages
RUN apk update
## Install the app and dependencies
RUN npm install --omit=dev \
      && npm cache clean --force \
      && rm -rf /tmp/*

## This app will listen on port 3000
EXPOSE 3000
## Switch to non-root user
USER node

CMD ["npm", "start"]
