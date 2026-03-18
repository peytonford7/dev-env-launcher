FROM alpine@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
RUN apk add --no-cache gtk+3.0 gtk+3.0-dev build-base bash pkgconf
WORKDIR /app
CMD ["bash", "-c", "cd /app && \
if [ -f Makefile ]; then \
  echo 'Makefile detected'; \
  make -s CXXFLAGS=\"-std=c11 $(pkg-config --cflags --libs gtk+-3.0)\"; \
fi && \
if [ -f main ]; then \
  echo 'Running main'; \
  ./main; \
fi && \
exec bash"]