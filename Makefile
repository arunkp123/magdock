#!make
include .env

install:
	@echo " \033[91m Initializing magento2 installation ...  \033[0m "
	@rm -rf www
	@sh setup.sh

sync:
	@docker-sync start

build:
	#docker build container
	@docker-compose build --no-cache 

rebuild:
	#docker rebuild container
	@docker-compose build --no-cache 

up:
	#docker compose up all containers
	@docker-compose up

reset-docker:
	#docker reset docker ecosystem
	@docker system prune

restart-magento:
	@docker-compose down && docker-compose up -d

sync-start:
	@docker-sync start

sync-stop:
	@docker-sync stop

sync-clean:
	@docker-sync clean

sync-force:
	@docker-sync sync


di-compile:
	@docker exec magento-web bash -c "php /var/www/html/magento/bin/magento setup:di:compile"

static-content:
	@docker exec magento-web bash -c "php /var/www/html/magento/bin/magento setup:static-content:deploy -f;"

cache:
	@docker exec magento-web bash -c "php /var/www/html/magento/bin/magento c:f; chmod -R 777 /var/www/html/magento;"













help:
	@echo ''
	@echo 'Usage: make [TARGET] [EXTRA_ARGUMENTS]'
	@echo 'Targets:'
	@echo '  build    		docker-compose build'
	@echo '  rebuild  		docker-compose build --no-cache'
	@echo '  up  	    	docker-compose up'
	@echo '  reset-docker  	docker system prune'
	@echo '  di-compile   	docker-compose up'
	@echo '  static-content	magento commant "bin/magento setup:static-content:deploy"'
	@echo '  clear-cache 	magento commant "bin/magento setup:static-content:deploy"'
	@echo '  permissions 	magento commant "bin/magento setup:static-content:deploy"'

	