start:
	rm -rf tmp/pids/server.pid
	bin/rails s -b 0.0.0.0

setup:
	bin/setup
	db-prepare

install:
	bundle check || bundle install

db-prepare:
	bin/rails db:reset
	bin/rails db:fixtures:load

test:
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

.PHONY: install lint test
