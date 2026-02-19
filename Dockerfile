#Build Container
FROM docker@sha256:8bcbad4b45f0bff9d3e809d85a7ac589390f0be8acbc526850c998c35c1243fd AS build

#Deploy Container
FROM build AS deploy
COPY ./start.sh .
RUN chmod +x /start.sh
COPY ./templates/ /templates/ 
CMD ["/start.sh"]

