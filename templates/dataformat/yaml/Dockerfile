FROM alpine:latest
WORKDIR /app
CMD ["sh", "-ec", "if [ -f main.yaml ]; then cat main.yaml; elif [ -f main.yml ]; then cat main.yml; fi; exec sh"]
