#!/bin/sh
DIR=${DEPLOY_DIR:-/maven}
echo "Checking *.war in $DIR"
if [ -d $DIR ]; then
  for i in $DIR/*.war; do
     file=$(basename $i)
     echo "Linking $i --> /opt/jetty/webapps/$file"
     ln -s $i /opt/jetty/webapps/$file
  done
fi
cd /opt/jetty
. /opt/jolokia/jolokia_env.sh
java ${JOLOKIA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar ./start.jar
