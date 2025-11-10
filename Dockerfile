# Base: official NGINX
FROM nginx:alpine

# Copy your site content into the default NGINX web root
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# NGINX runs as PID 1 in the foreground by default in this image
