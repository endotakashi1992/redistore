FROM node
RUN mkdir /app
ADD . /app
WORKDIR /app