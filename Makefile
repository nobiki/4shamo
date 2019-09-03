.DEFAULT_GOAL := help
.PHONY: help

PROJECT_NAME=4shamo
SCALE=1

hub: ## [Grid] Hub/Node up
	docker-compose -p ${PROJECT_NAME} up -d sele-hub

hub-destroy: ## [Grid] Hub/Node stop -> rm
	docker-compose -p ${PROJECT_NAME} stop sele-hub
	docker-compose -p ${PROJECT_NAME} rm -f sele-hub

hub-rerun: ## [Grid] make hub-destroy -> make hub
	make hub-destroy
	make hub

chrome: ## [Grid] Node(Chrome) up
	docker-compose -p ${PROJECT_NAME} up -d --scale sele-chrome=${SCALE} sele-chrome

chrome-destroy: ## [Grid] Node(Chrome) stop -> rm
	docker-compose -p ${PROJECT_NAME} stop sele-chrome
	docker-compose -p ${PROJECT_NAME} rm -f sele-chrome

chrome-rerun: ## [Grid] make chrome-destroy -> make chrome
	make chrome-destroy
	make chrome

firefox: ## [Grid] Node(Firefox) up
	docker-compose -p ${PROJECT_NAME} up -d --scale sele-firefox=${SCALE} sele-firefox

firefox-destroy: ## [Grid] Node(Firefox) stop -> rm
	docker-compose -p ${PROJECT_NAME} stop sele-firefox
	docker-compose -p ${PROJECT_NAME} rm -f sele-firefox

firefox-rerun: ## [Grid] make firefox-destroy -> make firefox
	make firefox-destroy
	make firefox

test: ## [Robotframework] test up
	docker-compose -p ${PROJECT_NAME} up -d 4shamo

test-stdout: ## [Robotframework] test up
	docker-compose -p ${PROJECT_NAME} up 4shamo

test-destroy: ## [Robotframework] test stop -> rm
	docker-compose -p ${PROJECT_NAME} stop 4shamo
	docker-compose -p ${PROJECT_NAME} rm -f 4shamo

test-rerun: ## [Robotframework] make test-destroy -> make test
	make test-destroy
	make test

help: # [Makefileを自己文書化する](https://postd.cc/auto-documented-makefile/)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
