#!/bin/bash

cd diaspora

j=$(nproc)
bundle config jobs $j
bundle config path /home/diaspora/gems

RAILS_ENV=production  DB=postgres  bin/bundle install --retry 5 --without test development --with postgresql
RAILS_ENV=production  DB=postgres  bin/bundle exec rake db:create db:schema:load
DB=postgres bundle exec rake assets:precompile
