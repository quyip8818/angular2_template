FROM node
EXPOSE 8080

ADD . /code
WORKDIR /code
RUN apt-get -yq update && \
    apt-get -yq install curl && \
    curl -L https://npmjs.org/install.sh | sh && \
    apt-get clean

RUN npm install -g typings webpack-dev-server rimraf webpack
RUN npm install
RUN typings install
RUN npm run build:prod
CMD npm run server:prod
