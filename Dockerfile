FROM node:14 as build

WORKDIR /app
# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application source code
COPY . .

# Build the React app
RUN npm run build

# Use a smaller nginx image for production
FROM nginx:alpine

# Copy the build output from the previous stage to the NGINX web server directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]