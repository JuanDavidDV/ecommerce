.DEAFULT_GOAL := help

 # DEVELOPMENT
###
.PHONY: run
run: ## run rails server and tailwind
	bin/dev

.PHONY: run-server
run-server: ## run rails server
	bin/rails s

.PHONY: reseed
reseed: remigrate ## recreate database and run the seed
	bin/rails db:seed

.PHONY: remigrate
remigrate: ## drops database and recreates it
	bin/rails db:drop db:create db:migrate

