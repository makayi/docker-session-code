# Set the baseImage to use for subsequent instructions. FROM must be the first instruction in a Dockerfile.
FROM mhart/alpine-node:10

#Execute any commands on top of the current image as a new layer and commit the results.
RUN mkdir -p /usr/src/app

# Set the baseImage to use for subsequent instructions. FROM must be the first instruction in a Dockerfile.
WORKDIR /usr/src/app

RUN apk add --no-cache make gcc g++ python

# Copy files or folders from source to the dest path in the image's filesystem.
COPY package*.json ./

COPY . .

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Provide defaults for an executing container. If an executable is not specified, then ENTRYPOINT must be specified as well. There can only be one CMD instruction in a Dockerfile.
EXPOSE 3000

CMD [ "node", "server.js" ]