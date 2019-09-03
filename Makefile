.DEFAULT_GOAL := help
.PHONY: help

export PROJECT_NAME=4shamo
export SCALE=3

hub: ## [Grid] Hub up
	docker-compose -p ${PROJECT_NAME} up -d sele-hub

hub-destroy: ## [Grid] Hub stop -> rm
	docker-compose -p ${PROJECT_NAME} stop sele-hub
	docker-compose -p ${PROJECT_NAME} rm -f sele-hub

node: ## [Grid] Node up
	docker-compose -p ${PROJECT_NAME} up -d --scale sele-chrome=${SCALE} --scale sele-firefox=${SCALE} sele-chrome sele-firefox

node-destroy: ## [Grid] Node down
	docker-compose -p ${PROJECT_NAME} stop sele-chrome
	docker-compose -p ${PROJECT_NAME} rm -f sele-chrome
	docker-compose -p ${PROJECT_NAME} stop  sele-firefox
	docker-compose -p ${PROJECT_NAME} rm -f  sele-firefox

test: ## [Robotframework] test up
	docker-compose -p ${PROJECT_NAME} run --rm 4shamo 1>/dev/null &

test-stdout: ## [Robotframework] test up
	docker-compose -p ${PROJECT_NAME} run --rm 4shamo

test-destroy: ## [Robotframework] test stop -> rm
	docker-compose -p ${PROJECT_NAME} stop 4shamo
	docker-compose -p ${PROJECT_NAME} rm -f 4shamo

test-rerun: ## [Robotframework] make test-destroy -> make test
	make test-destroy
	make test

help: # [Makefileを自己文書化する](https://postd.cc/auto-documented-makefile/)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
