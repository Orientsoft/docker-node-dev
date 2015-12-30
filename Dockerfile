FROM ubuntu:14.04

# use bash as default shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# base dependencies
RUN \
  apt-get update && apt-get install -y curl git build-essential tmux screen

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.2.4

# install nvm
RUN \
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.0/install.sh | bash

# install node with nvm
RUN \
  . $NVM_DIR/nvm.sh && \
  nvm install $NODE_VERSION && \
  nvm alias default $NODE_VERSION

# Set up our PATH correctly so we don't have to long-reference npm, node, &c.
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# update npm
RUN \
  npm i -g -U --verbose npm

# install global dependencies
RUN \
  npm i -g -U --verbose supervisor gulp gitignore pm2
