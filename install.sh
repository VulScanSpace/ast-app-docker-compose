#!/bin/bash
docker-compose -p ast-app -f nebula-docker-compose/docker-compose.yaml -f ast-app/docker-compose.yaml up
