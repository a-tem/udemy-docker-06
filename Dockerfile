# build phase
FROM node:16-alpine AS build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
