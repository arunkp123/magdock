

# MagDock
<img src="https://img.shields.io/badge/MagDock-Magento2.3.5%20on%20Docker-yellowgreen" /> 
<img src="https://img.shields.io/badge/php7.3.18-Magento2.3.5-blue" />

##### Install magento2 on docker with just a single command.
###### Tested on MacOS Mojave

## Installation Steps
#### Prerequisites ####
- Install docker-sync

- Install rsync

Refer for mac: https://duske.me/performant-docker-container-sync-with-docker-sync/

Look for installation guide online for Windows/Linux

#### Git clone repo and install magento2.3.5 #### 
```sh
$ git clone https://github.com/arunkp123/magdock.git
$ cd magdock
$ sudo make install
```
The complete installation should take 5-10 mins depending on system configuration and internet speed.

You can access website on below links 

Frontend: http://mystore.com:8030
   
   Admin: http://mystore.com:8030/admin (username/password: admin/Passw0rd@123)
   
## Commands for development

**Magento service commands**
```sh
$ make setup-upgrade  #Runs setup:upgrade && cache:clean && sets permissions

$ make di-compile  #Runs setup:di:compile && cache:clean && resets permissions
	
$ make static-content  #Runs setup:static-congtent:deploy && cache:clean && resets permissions
	
$ make cache-clean  #Runs cache:clean && resets permissions

$ make cache-flush  #Runs cache:clean && resets permissions

```

**Docker service commands**
```sh
$ make build  #To docker build container
	
$ make rebuild  # To rebuild docker container
	
$ make up  #docker compose up all containers
	
	
$ make reset-docker  #Reset docker ecosystem completely

$ make restart-magento  #Restart all containers for magento2

```

**rSync service commands**
```sh 

$ make sync-start #Starts Rsync service

$ make sync-stop  #Stops Rsync service

$ make sync-clean #Resets Rsync service
  
```
`Note: I am still working to make it more flexible for others to customize the settings accorinding to here needs`

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

