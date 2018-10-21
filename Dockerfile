FROM ruby:2.5.0

RUN apt-get update -qq
RUN apt-get install -y build-essential 
RUN apt-get install -y libpq-dev
RUN apt-get install -y nodejs

RUN mkdir /simplebbs-app
WORKDIR /simplebbs-app

ADD ./Gemfile /simplebbs-app/Gemfile
ADD ./Gemfile.lock /simplebbs-app/Gemfile.lock

RUN bundle install
ADD . /simplebbs-app

ENV PORT 3000
EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]