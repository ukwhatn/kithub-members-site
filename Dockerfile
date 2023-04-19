# syntax=docker/dockerfile:1

FROM ruby:3.2.1-slim

# OS Level Dependencies
RUN apt update -qq && apt install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    libvips \
    curl \
    libmariadb-dev \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

RUN gem update --system && gem install bundler

WORKDIR /usr/src/app

ENTRYPOINT ["./bin/docker-entrypoint.sh"]

EXPOSE 3000

CMD ["bin/dev"]
