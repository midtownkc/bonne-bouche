###
# First Stage 1: Install Ruby & POSIX Dependencies

# Make sure it matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.2.0
FROM ruby:$RUBY_VERSION as builder

ENV DEBIAN_FRONTEND=noninteractive

# Install JavaScript dependencies and libvips for Active Storage
ARG NODE_LTS_VERSION=18
RUN curl -sL https://deb.nodesource.com/setup_${NODE_LTS_VERSION}.x | bash \
    && apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    libvips \
    nodejs \
    && npm install -g yarn

###
# Build Stage 2: Install ruby gems & javascript packages
FROM builder AS dependencies

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle config set withouth "development test" && \
    bundle install \
    --retry 3 \
    --jobs 4

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

##
# Build Stage 3: Build Runtime Container
ARG RUBY_VERSION=3.2.0
FROM ruby:$RUBY_VERSION

# Install JavaScript dependencies and libvips for Active Storage
ARG NODE_LTS_VERSION=18
RUN curl -sL https://deb.nodesource.com/setup_${NODE_LTS_VERSION}.x | bash -
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    ca-certificates \
    libvips \
    nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
    && npm install -g yarn

RUN useradd -u 10500 -ms /bin/bash ruby

RUN chmod +t /tmp

WORKDIR /app

RUN chown ruby:ruby /app

USER ruby

COPY --chown=ruby --from=dependencies /usr/local/bundle/ /usr/local/bundle/

COPY --chown=ruby --from=dependencies /node_modules/ node_modules/

COPY --chown=ruby . ./

# Set production environment
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true"

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile --gemfile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE=`bin/rails secret` RAILS_ENV=production bundle exec rails assets:precompile

# Entrypoint prepares the database.
ENTRYPOINT ["/app/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
