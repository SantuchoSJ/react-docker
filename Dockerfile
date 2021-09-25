FROM node:alpine as builder

WORKDIR /client

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#RESULT IN /CLIENT/BUILD
FROM nginx 
EXPOSE 80
COPY --from=builder /client/build /usr/share/nginx/html
