FROM alpine@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
RUN apk add --no-cache mono build-base bash
WORKDIR /app
CMD ["bash", "-c", "cd /app && \
if [ -f Makefile ]; then \
  echo 'Makefile detected'; \
  make -s; \
fi && \
if [ -f main.exe ]; then \
  echo 'Running main.exe'; \
  mono main.exe; \
fi && \
exec bash"]