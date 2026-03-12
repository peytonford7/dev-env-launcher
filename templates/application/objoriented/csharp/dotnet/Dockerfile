FROM alpine@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
RUN apk add --no-cache bash build-base dotnet7-sdk
WORKDIR /app
CMD ["bash", "-c", "cd /app && \
if [ -f Makefile ]; then \
  echo 'Makefile detected'; \
  make; \
fi && \
if [ -f out/app.dll ]; then \
  echo 'Running app'; \
  dotnet out/app.dll; \
fi && \
exec bash"]