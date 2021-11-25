# Build
FROM node:16-alpine as build
WORKDIR /app
copy package.json .
RUN npm install && chmod 777 -R node_modules
COPY . .
RUN npm run build

# Run
FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
