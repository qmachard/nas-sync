#!/bin/sh

. ./config/config.ini

echo "\n######## Starting sync movies\n" >> ./log/movies.log

rsync -azv --exclude "couchpotato" "${SEEDBOX_USER}"@"${SEEDBOX_HOST}":"${SEEDBOX_PATH_MOVIES}" "${LOCAL_PATH_MOVIES}" >> ./log/movies.log

echo "\n######## Ending sync movies\n" >> ./log/movies.log