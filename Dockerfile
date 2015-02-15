FROM node
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN npm i -g gulp coffee-script nodemon
ENV PATH $PATH:/app/node_modules/.bin
CMD ["gulp","develop"]