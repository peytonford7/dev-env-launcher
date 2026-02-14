FROM debian/bookworm-slim:latest

RUN apt update && apt full-upgrade -y 

CMD ["/bin/bash"]
