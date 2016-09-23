FROM debian:jessie
MAINTAINER Florian Bigard <florian.bigard@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install net-tools gawk libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake bison libffi-dev subversion bzip2 sudo ps-watcher nodejs build-essential libssl-dev libcurl4-openssl-dev libxml2-dev libxslt-dev imagemagick git-core curl libmysqlclient-dev libmagickwand-dev sendmail redis-server cmake

RUN apt-get clean

RUN useradd -m -d /home/diaspora -s /bin/bash -p diaspora diaspora
RUN mkdir /tmp/ruby && cd /tmp/ruby \
  && curl -L --progress http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz | tar xz \
  && cd ruby-2.3.1 \
  && ./configure --disable-install-rdoc \
  && make -j2 \
  && make install

WORKDIR /home/diaspora
RUN gem install bundler

RUN sudo -u diaspora git clone https://github.com/diaspora/diaspora.git
RUN echo "cd diaspora && git checkout master" | sudo -u diaspora -i
RUN echo "Diaspora::Application.config.secret_key_base = 'aefeiru87675abbbcddd13' > /home/diaspora/diaspora/config/initializers/secret_token.rb"

WORKDIR diaspora
