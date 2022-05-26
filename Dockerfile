FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install -g @angular/cli
RUN npm install

COPY . .

CMD ["ng", "build"]

FROM nginx:alpine
EXPOSE 80
EXPOSE 8080
EXPOSE 4200

COPY --from=builder /app/dist/docker-workflow /usr/share/nginx/html
