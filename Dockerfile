FROM ruby:2.6.3-alpine

RUN set -ex

RUN apk update \
  && apk add --no-cache \
    alpine-sdk \
    mariadb-dev \
    tzdata \
  && gem install bundler --no-document

RUN mkdir /app
WORKDIR /app

EXPOSE 3000
CMD ["sh"]
# CMD ["sh", "-c", "bundle exec hanami server"]
