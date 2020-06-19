#!/usr/bin/env bash
SECONDS=0

MAGENTO_VERSION="2.3.5"
MAGENTO_REPO_URL="https://repo.magento.com/ magento/project-community-edition="${MAGENTO_VERSION}
PROJECT_PATH="www/html/magento"

echo " \033[93m Creating project path:  ${PROJECT_PATH}  \033[0m "
rm -rf www
mkdir -p ${PROJECT_PATH}

echo " \033[95m Starting docker-sync ...  \033[0m "
docker-sync stop
docker-sync clean
docker-sync start

echo " \033[95m Building docker images...  \033[0m "
docker-compose build --no-cache
echo " \033[95m Building docker containers...  \033[0m "
docker-compose up -d

echo " \033[93m Setting up Magento CE ${MAGENTO_VERSION} ... \033[0m "

echo " \033[93m ...Creating magento project directory \033[0m " \
&& cd ${PROJECT_PATH} \
&& echo " \033[93m ...Fetching magento code base from magento-${MAGENTO_VERSION} repo  \033[0m "  \
&& composer create-project --repository-url=${MAGENTO_REPO_URL} .
# Back to root directory
cd ../../../


echo " \033[95m ...Syncing code from host to container  \033[0m "
# Force code sync from host to container
chmod -R 777 ${PROJECT_PATH} && docker-sync sync


echo " \033[93m ...Installing magento   \033[0m "
docker exec magento-web bash -c " \
cd /var/www/html/magento 
chmod -R 777 *
php bin/magento setup:install --admin-firstname=Admin --admin-lastname=User --admin-email=test@test.com --admin-user=admin --admin-password=Passw0rd@123 --base-url=http://mystore.com:8030 --base-url-secure=https://mystore.com:8030 --backend-frontname=admin --db-host=mysql --db-name=magento --db-user=magento --db-password=magento --use-rewrites=1 --language=en_US --currency=USD --timezone=America/New_York --admin-use-security-key=1 --session-save=files --use-sample-data;
php bin/magento cache:flush;
php bin/magento cache:clean;" -d


echo " \033[93m ...Reset magento permissions   \033[0m "
docker exec magento-web bash -c " \
cd /var/www/html/magento && chmod -R 777 * "
chmod -R 777 ${PROJECT_PATH}
docker-sync stop
docker-sync start

echo " \033[92m ...Magento- successfully installed   \033[0m "

duration=$SECONDS
echo "\033[91m Installation time: $(($duration / 60)) minutes and $(($duration % 60)) seconds  \033[0m "