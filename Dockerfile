FROM ruby:2.6.5
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
CMD ruby ./exporter.rb -o 0.0.0.0 -p 9099