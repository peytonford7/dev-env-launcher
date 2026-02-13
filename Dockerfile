FROM debian:bookworm-slim

VOLUME /templates/

RUN apt update && apt full-upgrade -y 

CMD ["sleep 100"]
