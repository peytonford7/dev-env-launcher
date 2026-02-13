FROM debian:bookworm-slim

VOLUME /templates/

RUN apt update && apt full-upgrade -y nginx 

CMD ["nginx", "-g", "daemon off;"]
