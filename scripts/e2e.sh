#!/bin/bash

set -e

docker compose up -d --build &&

npx httpyac http/health.test.http \
  --var hostEndpoint="http://localhost:3002" \
  --all &&

docker compose down --remove-orphans
