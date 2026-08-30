FROM node:20-alpine AS ui-build
WORKDIR /app
COPY ./client ./client
RUN cd client && npm install && npm run build

FROM node:20-alpine AS server-build
WORKDIR /app
COPY ./nodeapi ./nodeapi
RUN cd nodeapi && npm install

FROM node:20-alpine
WORKDIR /app
COPY --from=ui-build /app/client/dist/client ./client/dist
COPY --from=server-build /app/nodeapi ./
CMD ["npm", "start"]

EXPOSE 4200
EXPOSE 5000
