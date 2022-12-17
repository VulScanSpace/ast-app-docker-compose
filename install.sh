#!/bin/bash
docker-compose -p ast-app -f ast-app/docker-compose.yaml -f nebula-docker-compose/docker-compose.yaml up
