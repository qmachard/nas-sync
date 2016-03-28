#!/bin/sh

. ./config/config.ini

echo "\n######## Starting sync movies\n"

rsync -azv --progress --exclude "couchpotato" "${SEEDBOX_USER}"@"${SEEDBOX_HOST}":"${SEEDBOX_PATH_MOVIES}" "${LOCAL_PATH_MOVIES}"

echo "\n######## Ending sync movies\n"