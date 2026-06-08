FROM nginx:1.27-alpine
WORKDIR /app
COPY default.conf /etc/nginx/conf.d/default.conf
COPY src/ /usr/share/nginx/html/
CMD ["sh", "-ec", "nginx -g 'daemon off;'"]
