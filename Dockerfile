# $ docker build --tag hanami-study .
# $ docker container run --rm --volume "$PWD:/app" -it hanami-study bundle install --clean
# $ docker container run -td -p 2300:2300 --volume "$PWD:/app" --name hanami-study hanami-study
# $ docker container exec -it hanami-study sh
# $ docker container exec hanami-study bundle install --clean --path vendor/bundle
# $ docker container exec hanami-study bundle exec hanami server

FROM ruby:2.6.3-alpine

RUN set -ex

RUN apk update \
  && apk add --no-cache \
    alpine-sdk \
    mariadb-dev \
    mariadb-client \
    tzdata \
  && gem install bundler --no-document

RUN mkdir /app
WORKDIR /app

EXPOSE 2300
CMD ["sh"]
# CMD ["sh", "-c", "bundle exec hanami server --daemonize=true"]
# CMD ["sh", "-c", "bundle exec hanami server"]
