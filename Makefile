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

.PHONY: infra-attach-hanami
infra-attach-hanami:
	docker attach `docker-compose ps -q hanami`

.PHONY: infra-logs
infra-logs:
	docker-compose logs -f

.PHONY: db-console
db-console:
	docker-compose exec db mysql -uroot -ppass

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

.PHONY: docker-hanami-shell
docker-hanami-shell:
	docker-compose run --rm hanami sh

.PHONY: docker-hanami-test
docker-hanami-test:
	docker-compose run --rm -e HANAMI_ENV=test hanami bundle exec rspec
