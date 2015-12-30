FROM ubuntu:14.04

# use bash as default shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# base dependencies
RUN \
  apt-get update && apt-get install -y curl git build-essential tmux screen

ENV NVM_DIR /usr/local/nvm

# install nvm
RUN \
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.0/install.sh | bash

# install node with nvm
RUN \
  . $NVM_DIR/nvm.sh && \
  nvm install v4 && \
  nvm alias default v4

# update npm
RUN \
  . $NVM_DIR/nvm.sh && \
  nvm use v4 && \
  npm i -g -U --verbose npm

# install install global dependencies
RUN \
  . $NVM_DIR/nvm.sh && \
  nvm use v4 && \
  npm i -g -U --verbose supervisor gulp gitignore pm2
