#!/bin/sh

set -eu

BASE_URL="${BASE_URL:=/}"
DESTINATION="${DESTINATION:=public}"
SOURCE="${SOURCE:=/src}"
THEME="${THEME:=hugo-lithium-theme}"

echo
echo "BASE_URL: $BASE_URL"
echo "DESTINATION: $DESTINATION"
echo "THEME: $THEME"
echo

if [ ! -d "/themes/$THEME" ]
then
    echo "[$0][ERROR] The $THEME theme does not exist in /themes, exiting."
    exit 1
fi

/usr/local/bin/hugo --source "$SOURCE" --theme "/themes/$THEME" --destination "$DESTINATION" --baseURL "$BASE_URL"

