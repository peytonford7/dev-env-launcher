FROM nginx/slim:latest

RUN mkdir /var/www && mkdir /var/www/html

ADD index.html /var/www/html
ADD style.css /var/www/html
ADD script.js /var/www/html

EXPOSE 80

RUN sudo apt update && apt full-upgrade -y

CMD ["nginx", "-g", daemon off;"]
