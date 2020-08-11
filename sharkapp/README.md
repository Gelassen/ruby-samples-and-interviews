# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Installation

$ rails new <app_name>
$ // verify there is no issues during installation (known issue with nodejs unsupported version)
$ rails g scaffold <model_name> title:string text:text
$ rails db:migrate
$ // setup routes
$ yarn install --check-files
$ bundle exec rails webpacker:install
$ ruby ./bin/webpack-dev-server
$ rails server
$ // everything should work now
