.PHONY: hanami-setup
hanami-setup:
	bundle install
	bundle exec hanami db create
	bundle exec hanami db migrate

.PHONY: infra-setup
infra-setup:
	docker-compose build
	docker-compose run --rm hanami make hanami-setup

.PHONY: infra-up
infra-up:
	docker-compose up

.PHONY: infra-up-d
infra-up-d:
	docker-compose up -d

.PHONY: infra-down
infra-down:
	docker-compose down

.PHONY: infra-logs
infra-logs:
	docker-compose logs -f

.PHONY: db-console
db-console:
	docker-compose exec db mysql -uroot -ppass

.PHONY: exec-hanami-server
exec-hanami-server:
	docker-compose exec hanami bundle exec hanami server --host=0.0.0.0

.PHONY: exec-hanami-console
exec-hanami-console:
	docker-compose exec hanami bundle exec hanami console

.PHONY: exec-hanami-migrate
exec-hanami-migrate:
	docker-compose exec hanami bundle exec hanami db migrate

.PHONY: exec-hanami-routes
exec-hanami-routes:
	docker-compose exec hanami bundle exec hanami routes

.PHONY: run-hanami-test
run-hanami-test:
	docker-compose run --rm -e HANAMI_ENV=test hanami bundle exec rspec
