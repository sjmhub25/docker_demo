# Step 1: Use the Nginx image as the base
FROM nginx:alpine

# Step 2: Copy all files from your current folder into the Nginx HTML directory
COPY . /usr/share/nginx/html/

# Step 3: Tell Docker to listen on port 80
EXPOSE 80

# Step 4: Start the web server
CMD ["nginx", "-g", "daemon off;"]
