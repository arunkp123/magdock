# MagDock

Install magento2 for development ready on docker with just a single command.

(Tested on Mac only)

## Installation Steps
#### Prerequisites ####
- Install docker-sync

- Install rsync

Refer for mac: https://duske.me/performant-docker-container-sync-with-docker-sync/

Look for installation guide online for Windows/Linux

#### Git clone repo and install magento2.3.5 #### 
```bash
git clone https://github.com/arunkp123/magdock.git
cd magdock
make install
```
The complete installation should take 5-10 mins depending on system configuration and internet speed.

You can access website on below links 

Frontend: http://mystore.com:8030
   
   Admin: http://mystore.com:8030/admin (username/password: admin/Passw0rd@123)
   
## Commands for development
**Docker service commands**
```docker
make build:
	#docker build container
	@docker-compose build

make rebuild:
	#docker rebuild container
	@docker-compose build --no-cache 

make up:
	#docker compose up all containers
	@docker-compose up

make reset-docker:
	#docker reset docker ecosystem
	@docker system prune

make restart-magento:
	@docker-compose down && docker-compose up -d
```

**Magento service commands**
```python
setup-upgrade:
	@docker exec magento-web bash -c "php /var/www/html/magento/bin/magento setup:upgrade; php /var/www/html/magento/bin/magento c:c; chmod -R 777 /var/www/html/magento;"

di-compile:
	@docker exec magento-web bash -c "php /var/www/html/magento/bin/magento setup:di:compile; php /var/www/html/magento/bin/magento c:c; chmod -R 777 /var/www/html/magento;"

static-content:
	@docker exec magento-web bash -c "php /var/www/html/magento/bin/magento setup:static-content:deploy -f; php /var/www/html/magento/bin/magento c:c; chmod -R 777 /var/www/html/magento;"

cache-clean:
	@docker exec magento-web bash -c "php /var/www/html/magento/bin/magento c:c; chmod -R 777 /var/www/html/magento;"

cache-flush:
	@docker exec magento-web bash -c "php /var/www/html/magento/bin/magento c:f; chmod -R 777 /var/www/html/magento;"

```
**Docker service commands**
```python

make build:
	#docker build container
	@docker-compose build

make rebuild:
	#docker rebuild container
	@docker-compose build --no-cache 

make up:
	#docker compose up all containers
	@docker-compose up

make reset-docker:
	#docker reset docker ecosystem
	@docker system prune

make restart-magento:
	@docker-compose down && docker-compose up -d

```
**rSync service commands**
```python 

make sync-start
	@docker-sync start

make sync-stop
	@docker-sync stop

make sync-clean
	@docker-sync clean
  
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
