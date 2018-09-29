selenium:
	docker-compose up -d sele-hub sele-chrome sele-firefox

test:
	docker-compose up -d 4shamo

test-destroy:
	docker-compose stop 4shamo
	docker-compose rm -f 4shamo

test-rerun:
	make test-destroy
	make test
