# wildfly-vagrant-vm
minimal configurable Vagrant VM with Wildfly, MySQL and PHPMyAdmin running in Docker

# Quickstart

- Configure the settings in base.yml
- Configure Wildfly standalone in wildfly-mysql-javaee7/configuration/xml/standalone.xml
- Place war file in wildfly-mysql-javaee7/server-data/wildfly-deployments/
- Put MySQL SQL init files into wildfly-mysql-javaee7/mysqlinit/

# Persisted Folders

- All folders in server-data/ are persistent between restarts/rebuilds/etc of the VM

# Known Issues

- MySQL only has default SSL settings
