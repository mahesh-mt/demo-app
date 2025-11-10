FROM public.ecr.aws/docker/library/node:16.20.2-alpine3.18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY patches ./patches
RUN npx patch-package
COPY . .
RUN npm run build
