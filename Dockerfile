FROM ruby:2.6.4-stretch

RUN apt-get update && apt-get install -y \
  build-essential

RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
ENV app /app
RUN mkdir -p $app
WORKDIR $app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.

ENV RACK_ENV production

COPY Gemfile Gemfile.lock ./
RUN gem install bundler

RUN bundle config --global frozen 1
RUN bundle install

# Copy the main application.
COPY . $app

RUN ["chmod", "+x", "bin/start"]

# The main command to run when the container starts.
ENTRYPOINT ["./bin/start"]
