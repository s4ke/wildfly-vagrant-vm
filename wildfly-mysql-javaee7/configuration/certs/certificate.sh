#!/bin/sh

DOMAIN="wlfly"
DNAME="C=DE,ST=Bavaria,O=RMC,L=RMC,CN=wlfly,OU=DEVELOPMENT,emailAddress=email@sample.com"

SERVER_PASSWORD=$(head -c 2000 /dev/urandom | tr -dc a-z0-9A-Z | head -c 256)

keytool -genkey -noprompt -alias server.$DOMAIN -keyalg RSA -keysize 2048 -keystore server.$DOMAIN.keystore -storepass $SERVER_PASSWORD -keypass $SERVER_PASSWORD -validity 3650 -dname $DNAME

sed -i "s/weak42/$SERVER_PASSWORD/g" ../standalone.xml

CLIENT_PASSWORD=$(head -c 2000 /dev/urandom | tr -dc a-z0-9A-Z | head -c 256)

keytool -genkey -noprompt -alias client.$DOMAIN -keyalg RSA -keysize 2048 -keystore client.$DOMAIN.keystore -storepass $CLIENT_PASSWORD -keypass $CLIENT_PASSWORD -validity 3650 -storetype pkcs12 -dname $DNAME

keytool -exportcert -keystore client.$DOMAIN.keystore -storetype pkcs12 -storepass $CLIENT_PASSWORD -alias client.$DOMAIN -keypass $CLIENT_PASSWORD -file client.$DOMAIN.cer
keytool -import -noprompt -file client.$DOMAIN.cer -alias client.$DOMAIN -keystore client.$DOMAIN.truststore -storepass $CLIENT_PASSWORD -keypass $CLIENT_PASSWORD
