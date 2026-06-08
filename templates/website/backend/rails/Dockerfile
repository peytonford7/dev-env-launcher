FROM ruby:3.3-alpine
RUN apk add --no-cache build-base sqlite-dev
WORKDIR /app
CMD ["sh", "-ec", "if [ -f Gemfile ]; then bundle install; fi; if [ -f config.ru ]; then bundle exec rackup -o 0.0.0.0 -p 3000; elif [ -f main.rb ]; then ruby main.rb; fi; exec sh"]
