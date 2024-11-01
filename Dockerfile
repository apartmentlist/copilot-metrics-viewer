# Stage 1: Build the Vue.js application
FROM docker.io/node:22 AS build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "serve"]

# Stage 2: Serve the application with Nginx
#FROM docker.io/nginx:1.27 AS production-stage

#COPY --from=build-stage /app/dist /usr/share/nginx/html
#COPY --from=build-stage /app/dist/assets/app-config.js /usr/share/nginx/html-template/app-config.template.js
#COPY ./docker-entrypoint.d/*.sh /docker-entrypoint.d/
#RUN chmod +x /docker-entrypoint.d/*.sh
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
