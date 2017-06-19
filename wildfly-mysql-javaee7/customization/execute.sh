#!/bin/sh

# Usage: execute.sh [WildFly mode] [configuration file]
#
# The default mode is 'standalone' and default configuration is based on the
# mode. It can be 'standalone.xml' or 'domain.xml'.

JBOSS_HOME=/opt/jboss/wildfly
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh
JBOSS_MODE=${1:-"standalone"}
JBOSS_CONFIG=${2:-"$JBOSS_MODE.xml"}

$JBOSS_HOME/bin/add-user.sh $WILDFLY_ADMIN $WILDFLY_ADMIN_PW --silent
$JBOSS_HOME/bin/add-user.sh -a $WILDFLY_ADMIN $WILDFLY_ADMIN_PW -g user,admin --silent
$JBOSS_HOME/bin/add-user.sh -a $WILDFLY_USER $WILDFLY_USER_PW -g user --silent

echo "=> Starting WildFly"
$JBOSS_HOME/bin/$JBOSS_MODE.sh -b 0.0.0.0 -c $JBOSS_CONFIG $WILDFLY_DEBUG

