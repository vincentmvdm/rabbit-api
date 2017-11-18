#!/usr/bin/env bash
./devBuild.sh

docker push vincentmvdm/rabbit-api

export RABBITADDR=test-rabbitsvr:5672

docker network create test-messages

docker rm -f rabbit-api
docker rm -f test-rabbitsvr

docker pull vincentmvdm/rabbit-api

docker run -d --hostname rabbit --name test-rabbitsvr \
--network test-messages \
rabbitmq:3

docker run -d --name rabbit-api \
--network test-messages \
-e RABBITADDR=$RABBITADDR \
-p 80:80 \
vincentmvdm/rabbit-api