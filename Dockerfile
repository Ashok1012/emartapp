FROM node:20-alpine AS UI-BUILD
WORKDIR /app
COPY ./client ./client
RUN cd client && npm install && npm run build

FROM node:20-alpine AS SERVER-BUILD
WORKDIR /app
COPY ./nodeapi ./nodeapi
RUN cd nodeapi && npm install

FROM node:20-alpine
WORKDIR /app
COPY --from=UI-BUILD /app/client/dist/client ./client/dist
COPY --from=SERVER-BUILD /app/nodeapi ./
CMD ["npm", "start"]

EXPOSE 4200
EXPOSE 5000
