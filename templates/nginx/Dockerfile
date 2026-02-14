FROM nginx/slim:latest

COPY ./index.html /var/lib/share/html/
COPY ./style.css /var/lib/share/html/
COPY ./script.js /var/lib/share/html/

EXPOSE 80

CMD ["nginx", "-g", daemon off;"]
