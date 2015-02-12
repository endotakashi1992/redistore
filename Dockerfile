FROM node
RUN mkdir /app
ADD . /app
WORKDIR /app

ENV PATH $PATH:/app/node_modules/.bin