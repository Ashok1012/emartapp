FROM node:20-alpine as build
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=build /app/dist/client /usr/share/nginx/html
CMD ["nginx", "-g" ,"daemon off;"]


COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 4200
EXPOSE 80
