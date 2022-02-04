#!/bin/bash
# This script is meant to be run as a Circle CI step to send a notification to Slack

# specifies the content of the slack post
MSG_TEXT=${1?"msg_text parameter is required"}
# specifies the color of the post (left side), one of good, danger, warning or hex color
MSG_COLOR=${2:-"good"}
# specifies the title of the post, it can be combines with emojis
MSG_TITLE=${3:-":tundra-electric: build"}

if [[ -z "${SLACK_WEBHOOK}" ]] ; then
    echo "SLACK_WEBHOOK environment variable is not set"
    exit 0
fi

escapedText=$(echo $MSG_TEXT | sed 's/"/\"/g' | sed "s/'/\'/g" )

jsonPayload='{ "icon_emoji": ":tundra-electric:", "username": "tundra-builds", "attachments":[ { "title": "'$MSG_TITLE'", "text": "'$escapedText'", "color": "'$MSG_COLOR'" } ]  }'

echo curl -s -o /dev/null -X POST -H 'Content-type: application/json' --data "${jsonPayload}" "${SLACK_WEBHOOK}"



