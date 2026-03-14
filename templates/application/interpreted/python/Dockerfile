FROM alpine@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
RUN apk update && apk add --no-cache python3 bash
WORKDIR /app
CMD ["bash", "-c", "cd /app && \
if [ -f main.py ]; then \
  echo 'Running main.py'; \
  python3 main.py; \
fi && \
exec bash"]