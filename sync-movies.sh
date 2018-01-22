#!/bin/sh

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. ${ROOT}/config/config.ini

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

cd ${LOCAL_PATH_MOVIES}

lftp ftp://${SEEDBOX_USER}:${SEEDBOX_PASSWORD}@${SEEDBOX_HOST} -e "
    set ssl:verify-certificate false;
    cd ${SEEDBOX_PATH_MOVIES};
    mirror . --continue --verbose --exclude=.*\.jpe?g --exclude=.*\.png --exclude=.*\.gif;
    exit;"

echo "\n######## Ending sync movies\n"

rm /tmp/sync-movies
