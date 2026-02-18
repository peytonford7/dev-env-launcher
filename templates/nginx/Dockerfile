FROM alpine@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659

RUN apk update
RUN apk add nginx

COPY /templates/nginx/index.html /var/www/localhost/htdocs
COPY /templates/nginx/styles.css /var/www/localhost/htdocs
COPY /templates/nginx/script.js /var/www/localhost/htdocs

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
