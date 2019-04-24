FROM node:8-alpine as build-stage

RUN apk add --no-cache --update \
  python \
  make \
  gcc \
  g++ \
  musl-dev

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .


FROM node:8-alpine as production-stage
COPY --from=build-stage /app /app
WORKDIR /app
CMD ["npm", "run", "docker"]
