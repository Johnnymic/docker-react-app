# Stage 1: Build the application
FROM node:16-alpine AS builder

WORKDIR /app

COPY package.json ./
RUN npm install
COPY . .

RUN npm run build

# Stage 2: Serve the application with nginx
FROM nginx:latest

COPY --from=builder /app/build /usr/share/nginx/html

CMD ["npm", "run", "start"]


