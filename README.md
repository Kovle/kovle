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
docker volume create --name kovle-postgres
docker volume create --name drkiq-redis
docker­-compose run kovle rails db:reset
docker­-compose run kovle rails db:migrate
docker-compose up

* ...
# kovle