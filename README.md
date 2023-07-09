# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  3.1.3

* System dependencies
  none
  
* Configuration
  Rails 6.1.7.3
  Node 15.7.0
  DB PostgreSQL

* Database creation
  $ bundle exec rails db:resett

* Database initialization
  $ bundle exec rails db:seed

* How to run the test suite
  $ bundle exec rails  server

* Services (job queues, cache servers, search engines, etc.)

  This application has the following features:

  - Viewing a list and details of articles created by all users.
  
  - Editing and deleting articles created by oneself (requires login).
  
  - Creating new articles (requires login).
  
  - Associating articles with tags (multiple tags are possible).
  
  - Currently, there is a limit of 50 articles per user and up to 5 tags.
