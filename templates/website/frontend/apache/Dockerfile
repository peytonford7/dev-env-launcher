FROM httpd:2.4-alpine
WORKDIR /app
COPY src/ /usr/local/apache2/htdocs/
CMD ["sh", "-ec", "httpd-foreground"]
