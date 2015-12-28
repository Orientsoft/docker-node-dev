FROM ubuntu:14.04

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN \
  apt-get update && apt-get install -y curl git build-essential

ENV NVM_DIR /usr/local/nvm

RUN \
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.0/install.sh | bash && \
  . $NVM_DIR/nvm.sh && \
  nvm install v4 && \
  nvm alias default v4 && \
  nvm use v4 && \
  npm i -g -U --verbose supervisor gulp gitignore
