#!/bin/bash

DEFAULT_WS_PORT=8001
DEFAULT_HTTP_PORT=8002
DEFAULT_WSS=true
DEFAULT_SSL_CRT=/opt/minimonkey_server/certs/mj_wildcard/STAR_minijuegos_com.crt
DEFAULT_SSL_KEY=/opt/minimonkey_server/certs/mj_wildcard/STAR_minijuegos_com.key
DEFAULT_STATSD=true
DEFAULT_ENV=prod
DEFAULT_JMX_HOST=10.13.119.68
DEFAULT_JMX_PORT=8003

IS_WSS=${IS_WSS:-$DEFAULT_WSS}
SSL_CRT=${SSL_CRT:-$DEFAULT_SSL_CRT}
SSL_KEY=${SSL_KEY:-$DEFAULT_SSL_KEY}
IS_STATSD=${IS_STATSD:-$DEFAULT_STATSD}
ENV=${ENV:-$DEFAULT_ENV}
WS_PORT=${WS_PORT:-$DEFAULT_WS_PORT}
HTTP_PORT=${HTTP_PORT:-$DEFAULT_HTTP_PORT}
JMX_HOST=${JMX_HOST:-$DEFAULT_JMX_HOST}
JMX_PORT=${JMX_PORT:-$DEFAULT_JMX_PORT}

echo "Starting Minimonkey server..."
cd /opt/minimonkey_server/jar/
exec java -Xms1024m -Xmx8192m -cp .:minimonkey.jar -Dssl=$IS_WSS -DsslCrt=$SSL_CRT -DsslKey=$SSL_KEY -Dstatsd=$IS_STATSD -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=$JMX_HOST -Dcom.sun.management.jmxremote.port=$JMX_PORT -Dcom.sun.management.jmxremote.authenticate=false com.miniplay.minimonkey.server.RunServer $WS_PORT $HTTP_PORT $ENV
