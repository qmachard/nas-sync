#!/bin/sh

. ./config/config.ini

# Is already launch
if test -f /tmp/sync-movies
then
	echo "[Error] This script is already running"
	exit 3
else
	touch /tmp/sync-movies
fi

# Create folder if not exists
if [ ! -d "${LOCAL_PATH_MOVIES}" ]; then
    mkdir -p "${LOCAL_PATH_MOVIES}"
fi

echo "\n######## Starting sync movies\n"

rsync -azv --exclude "couchpotato" "${SEEDBOX_USER}"@"${SEEDBOX_HOST}":"${SEEDBOX_PATH_MOVIES}" "${LOCAL_PATH_MOVIES}"

echo "\n######## Ending sync movies\n"

rm /tmp/sync-movies
