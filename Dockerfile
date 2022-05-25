FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install -g @angular/cli
RUN npm install

COPY . .

CMD ["ng", "build"]

FROM nginx:alpine

COPY --from=builder /app/dist/docker-workflow /usr/share/nginx/html
