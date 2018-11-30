.DEFAULT_GOAL := help
.PHONY: help

selenium: ## docker-compose up [Grid]
	docker-compose up -d sele-hub sele-chrome sele-firefox

selenium-destroy: ## docker-compose (stop -> rm) [Grid]
	docker-compose stop sele-hub sele-chrome sele-firefox
	docker-compose rm -f sele-hub sele-chrome sele-firefox

selenium-rerun: ## selenium-destroy -> selenium [Grid]
	make selenium-destroy
	make selenium

test: ## docker-compose up [Robotframework]
	docker-compose up -d 4shamo

test-destroy: ## docker-compose (stop -> rm) [Robotframework]
	docker-compose stop 4shamo
	docker-compose rm -f 4shamo

test-rerun: ## test-destroy -> test [Robotframework]
	make test-destroy
	make test

help: # [Makefileを自己文書化する](https://postd.cc/auto-documented-makefile/)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
