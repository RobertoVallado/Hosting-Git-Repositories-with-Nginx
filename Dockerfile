FROM nginx:alpine

# Copy the default Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the Git repositories and their index.html files
COPY repos /usr/share/nginx/html
