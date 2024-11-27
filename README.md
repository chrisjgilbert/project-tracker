# README

## To run the app for the first time

Ensure you have ruby 3.3.1.

```
# install gems
bundle install

# create db and run migrations (sqlite)
bundle exec rake db:create
bundle exec rake db:migrate

# start the rails dev server
./bin/dev
```
