#!/bin/bash

APP_ID_OR_NAME= your heroku app name or app id
TOKEN=secret token # use heroku auth:token

curl -n -X POST https://api.heroku.com/apps/$APP_ID_OR_NAME/dynos \
  -d '{
  "attach": false,
  "command": "bash build.sh",
  "force_no_tty": null,
  "size": "free",
  "type": "builder",
  "time_to_live": 1800
}' \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.heroku+json; version=3" \
  -H "Authorization: Bearer $TOKEN"
