FROM mhart/alpine-node:10

RUN mkdir -p /usr/src/app

# Create app directory
WORKDIR /usr/src/app

RUN apk add --no-cache make gcc g++ python


# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

COPY . .

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

EXPOSE 3000

CMD [ "node", "server.js" ]