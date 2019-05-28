.DEFAULT_GOAL := help
.PHONY: help

PROJECT_NAME=4shamo

selenium: ## docker-compose up [Grid]
	docker-compose -p ${PROJECT_NAME} up -d sele-hub sele-chrome sele-firefox

selenium-destroy: ## docker-compose (stop -> rm) [Grid]
	docker-compose -p ${PROJECT_NAME} stop sele-hub sele-chrome sele-firefox
	docker-compose -p ${PROJECT_NAME} rm -f sele-hub sele-chrome sele-firefox

selenium-rerun: ## selenium-destroy -> selenium [Grid]
	make selenium-destroy
	make selenium

test: ## docker-compose up [Robotframework]
	docker-compose -p ${PROJECT_NAME} up -d 4shamo

test-destroy: ## docker-compose (stop -> rm) [Robotframework]
	docker-compose -p ${PROJECT_NAME} stop 4shamo
	docker-compose -p ${PROJECT_NAME} rm -f 4shamo

test-rerun: ## test-destroy -> test [Robotframework]
	make test-destroy
	make test

help: # [Makefileを自己文書化する](https://postd.cc/auto-documented-makefile/)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
