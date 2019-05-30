.DEFAULT_GOAL := help
.PHONY: help

PROJECT_NAME=4shamo

selenium: ## [Grid] Hub/Node up
	docker-compose -p ${PROJECT_NAME} up -d sele-hub sele-chrome sele-firefox

selenium-destroy: ## [Grid] Hub/Node stop -> rm
	docker-compose -p ${PROJECT_NAME} stop sele-hub sele-chrome sele-firefox
	docker-compose -p ${PROJECT_NAME} rm -f sele-hub sele-chrome sele-firefox

selenium-rerun: ## [Grid] make selenium-destroy -> make selenium
	make selenium-destroy
	make selenium

test: ## [Robotframework] test up
	docker-compose -p ${PROJECT_NAME} up -d 4shamo

test-destroy: ## [Robotframework] test stop -> rm
	docker-compose -p ${PROJECT_NAME} stop 4shamo
	docker-compose -p ${PROJECT_NAME} rm -f 4shamo

test-rerun: ## [Robotframework] make test-destroy -> make test
	make test-destroy
	make test

help: # [Makefileを自己文書化する](https://postd.cc/auto-documented-makefile/)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
