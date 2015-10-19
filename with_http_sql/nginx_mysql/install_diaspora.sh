#!/bin/bash

cd diaspora

j=$(nproc)
bundle config jobs $j
bundle config path /home/diaspora/gems

RAILS_ENV=production bin/bundle install --retry 5 --without test development
RAILS_ENV=production bin/bundle exec rake db:create db:schema:load
bundle exec rake assets:precompile
