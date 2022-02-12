.PHONY: hanami-setup
hanami-setup:
	bundle install
	bundle exec hanami db create
	bundle exec hanami db migrate
	# cd apps/admin && npm install # nodeはいってないわ

.PHONY: docker/*

docker/setup:
	docker-compose build
	docker-compose run --rm hanami make hanami-setup

docker/up:
	docker-compose up

docker/up-d:
	docker-compose up -d

docker/down:
	docker-compose down

docker/attach-hanami:
	docker attach `docker-compose ps -q hanami`

docker/logs:
	docker-compose logs -f

.PHONY: db-console
db-console:
	docker-compose exec db mysql -uroot -ppass

.PHONY: docker-hanami-install
docker-hanami-install:
	docker-compose exec hanami bundle install

.PHONY: docker-hanami-server
docker-hanami-server:
	docker-compose exec hanami bundle exec hanami server --host=0.0.0.0

.PHONY: docker-hanami-console
docker-hanami-console:
	docker-compose exec hanami bundle exec hanami console

.PHONY: docker-hanami-migrate
docker-hanami-migrate:
	docker-compose exec hanami bundle exec hanami db migrate

.PHONY: docker-hanami-routes
docker-hanami-routes:
	docker-compose exec hanami bundle exec hanami routes

.PHONY: docker-hanami-assets-precompile
docker-hanami-assets-precompile:
	docker-compose run --rm hanami bundle exec hanami assets precompile

.PHONY: docker-hanami-shell
docker-hanami-shell:
	docker-compose run --rm hanami sh

.PHONY: docker-hanami-test
docker-hanami-test:
	docker-compose run --rm -e HANAMI_ENV=test hanami bundle exec rspec
