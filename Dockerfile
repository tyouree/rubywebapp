FROM ruby:3.0.0

ENV LANG C.UTF-8
ENV APP=/rubywebapp

RUN echo 'Asia/Tokyo' > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
    apt-get install -y npm && \
    apt-get install -y postgresql-client && \
    apt-get install -y yarn && \
    apt-get install -y libpq-dev && \
    apt-get install -y libsqlite3-dev

RUN mkdir ${APP}

WORKDIR ${APP}

COPY Gemfile ${APP}/Gemfile

COPY Gemfile.lock ${APP}/Gemfile.lock

RUN gem update --system

RUN bundle install

RUN rails db:create

RUN npm install n -g

RUN n stable

RUN apt purge -y nodejs npm

RUN yarn add @rails/web packer
#RUN rails webpacker:install
#RUN rails webpacker:compile

COPY . ${APP}

# puma.sockを配置するディレクトリを作成
RUN mkdir -p /tmp/sockets
RUN touch /tmp/sockets/puma.sock
