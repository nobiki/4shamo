.DEFAULT_GOAL := help
.PHONY: help

export PROJECT_NAME=4shamo
export SCALE=1

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

gpu-node-build: ## [Grid] Node build
	docker-compose -p ${PROJECT_NAME} build gpu-chrome

gpu-net: ## [Network] create gpu-net
	docker network create --driver bridge gpu-net

gpu-hub: ## [Hub] Node up (GPU)
	docker run -d --init -p 4445:4444 --name gpu-hub --net gpu-net selenium/hub:3.141.59

gpu-node: ## [Grid] Node up (GPU Chrome)
	docker run -d --init --gpus all -p 15701:5900 --name gpu-node --net gpu-net --env-file docker/gpu-node.env -v /tmp/.X11-unix/:/tmp/.X11-unix:rw gpu-chrome:latest

gpu-node-tty: ## [Grid] Node tty
	docker exec -it gpu-node bash

gpu-test-stdout: ## [Robotframework] gpu-test up
	docker run --rm --net gpu-net -v ${PWD}/gpu-tests/:/tests -v ${PWD}/bootstrap.sh:/bootstrap.sh 4shamo_4shamo:latest /bootstrap.sh

gpu-test-tty: ## [Robotframework] gpu-test up
	docker run --rm -it --net gpu-net -v ${PWD}/gpu-tests/:/tests -v ${PWD}/bootstrap.sh:/bootstrap.sh 4shamo_4shamo:latest bash

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
