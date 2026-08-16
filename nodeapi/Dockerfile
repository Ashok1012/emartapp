FROM node:20-alpine as build
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=build /app/ /app/
CMD ["npm", "start"]
EXPOSE 4200
