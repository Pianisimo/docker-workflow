FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install -g @angular/cli
RUN npm install

COPY . .

#RUN ng build *CMD won't work with docker in travis ci, use this line and remove below
CMD ["ng", "build"]

FROM nginx:alpine

EXPOSE 80

COPY --from=builder /app/dist/docker-workflow /usr/share/nginx/html
