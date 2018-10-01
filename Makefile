selenium:
	docker-compose up -d sele-hub sele-chrome sele-firefox

selenium-destroy:
	docker-compose stop sele-hub sele-chrome sele-firefox
	docker-compose rm -f sele-hub sele-chrome sele-firefox

selenium-rerun:
	make selenium-destroy
	make selenium

test:
	docker-compose up -d 4shamo

test-destroy:
	docker-compose stop 4shamo
	docker-compose rm -f 4shamo

test-rerun:
	make test-destroy
	make test
