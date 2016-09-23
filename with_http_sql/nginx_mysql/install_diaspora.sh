#!/bin/bash

cd diaspora

j=$(nproc)
bundle config jobs $j
bundle config path /home/diaspora/gems

RAILS_ENV=production bin/bundle install --deployment --retry 5 --without test development --with mysql
RAILS_ENV=production bin/rake db:create db:schema:load
RAILS_ENV=production bin/rake assets:precompile
