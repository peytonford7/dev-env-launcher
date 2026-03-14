FROM swift:5.8
RUN apt-get update && apt-get install -y build-essential bash
WORKDIR /app
CMD ["bash", "-c", "cd /app && \
if [ -f Makefile ]; then \
  echo 'Makefile detected'; \
  make; \
fi && \
if [ -f main ]; then \
  echo 'Running main'; \
  ./main; \
fi && \
exec bash"]